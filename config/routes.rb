Rails.application.routes.draw do
  root to: 'contents#index'
  devise_for :users
  resources :contents do
    resources :posts, only: [:show, :new, :create, :destroy, :edit, :update]
    collection do
      get 'articles'
      get 'photos'
    end
  end
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show]

end
