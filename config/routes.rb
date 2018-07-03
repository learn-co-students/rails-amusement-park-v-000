Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides, only:[:create]

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root to: "welcome#home"
end
