Rails.application.routes.draw do
  root "application#home"
  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy"
  post "/sessions/create", to: "sessions#create"
  resources :attractions
  resources :users
  resources :rides, only: [:new]
end
