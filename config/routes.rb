Rails.application.routes.draw do
  resources :users
  resources :attractions

  post "/rides/new", to: "rides#new"

  root "static#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end
