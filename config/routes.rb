Rails.application.routes.draw do
  devise_for :users

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
  end

  scope :api do
    scope :v1 do
      scope :instagram do
        get '/' => 'api/v1/instagram#confirm'
        post '/' => 'api/v1/instagram#update'
      end
    end
  end
end
