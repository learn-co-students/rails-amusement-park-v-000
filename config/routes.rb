Rails.application.routes.draw do
  resources :users
  resources :attractions

  root "static#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"


end
