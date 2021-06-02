Rails.application.routes.draw do
  root to: 'contents#index'
  devise_for :users
  resources :contents do
    resources :posts, only: [:show, :new, :create, :destroy, :edit, :update]
  end
  resources :comments, only: [:create]
end
