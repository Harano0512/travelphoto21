Rails.application.routes.draw do
  root to: 'contents#index'
  devise_for :users
  resources :contents
  resources :posts
end
