Rails.application.routes.draw do
  root 'users#index'
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :show]
end
