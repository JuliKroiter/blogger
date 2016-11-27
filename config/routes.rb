require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  apipie
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'home#index'

  namespace :admin do
    root 'posts#index'

    resources :users
    resources :posts
    resources :comments
    resources :categories do
      collection do
        get 'topic_categories' => 'categories#topic_categories'
      end
    end
    resources :topics

    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  namespace :api do
    namespace :v1 do

      namespace :instagram do
        get '/' => 'api/v1/instagram#confirm'
        post '/' => 'api/v1/instagram#update'
      end
      namespace :facebook do
        get '/' => 'api/v1/facebook#confirm'
        post '/' => 'api/v1/facebook#update'
      end
      resources :api_users, only: [:create]
      resources :posts, only: [:index, :show]

      match "*path", to: "base#catch_404", via: :all
    end
  end
end
