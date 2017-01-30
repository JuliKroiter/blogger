require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  apipie
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'home#index'
  resources :posts, only: [:index, :show]
  get 'about' => 'home#about'
  get 'partners' => 'home#partners'
  post 'order_book' => 'home#order_book'
  post 'order_consultation' => 'home#order_consultation'
  post 'create_comment' => 'posts#create_comment'
  post 'free_planer' => 'home#free_planer'
  post 'contact_me' => 'home#contact_me'
  get 'search', to: 'search#search'
  get 'show_posts' => 'posts#show_posts'
  get 'more_comments' => 'posts#more_comments'
  get 'polygraphy' => 'home#polygraphy'

  namespace :admin do
    root 'posts#index'

    resources :users
    resources :posts
    resources :comments
    resources :books
    resources :authors
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

      get '/instagram' => 'instagram#confirm'
      post '/instagram' => 'instagram#update'

      get '/facebook' => 'facebook#confirm'
      post '/facebook' => 'facebook#update'

      resources :api_users, only: [:create]
      resources :posts, only: [:index, :show]
    end
  end
end
