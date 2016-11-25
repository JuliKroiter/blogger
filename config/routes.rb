require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
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

  scope :api do
    scope :v1 do
      scope :instagram do
        get '/' => 'api/v1/instagram#confirm'
        post '/' => 'api/v1/instagram#update'
      end
      scope :facebook do
        get '/' => 'api/v1/facebook#confirm'
        post '/' => 'api/v1/facebook#update'
      end
    end
  end

end
