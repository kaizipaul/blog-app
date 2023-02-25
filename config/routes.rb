Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end

   # Apis
   namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, format: :json do
          resources :comments, format: :json
        end
      end
    end
  end
  
  # Defines the root path route ("/")
  root 'users#index'
end
