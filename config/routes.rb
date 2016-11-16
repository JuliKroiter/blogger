Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'posts#index'

    resources :users
    resources :posts
    resources :comments
    resources :categories
  end
end
