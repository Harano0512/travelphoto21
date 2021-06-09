Rails.application.routes.draw do
  get 'prefectures/show'
  root to: 'contents#index'
  devise_for :users
  resources :contents do
    resources :posts, only: [:show, :new, :create, :destroy, :edit, :update]
    collection do
      get 'articles'
      get 'photos'
      get 'search'
    end
  end
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :prefectures, only: [:show]
end
