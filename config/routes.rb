Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :likes, only: [:create, :destroy]
  
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
