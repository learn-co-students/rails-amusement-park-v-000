Rails.application.routes.draw do
  root 'users#index'
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
  resources :users
  resources :attractions
end
