Rails.application.routes.draw do
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  post "/rides/new", to: "rides#new"

  resources :attractions
  resources :users

  root "welcome#home"


end
