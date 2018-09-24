Rails.application.routes.draw do

  root to: 'application#home'
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :rides, only: [:new]
  resources :users
  resources :attractions

end
