Rails.application.routes.draw do

  root "static#home"
  resources :users
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :attractions
  post "/rides/new", to: "rides#new"
end
