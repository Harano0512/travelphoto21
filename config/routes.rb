Rails.application.routes.draw do
  root to: "contents#index"
  devise_for :users
  resources :contents, only: [:index, :new, :create]
end
