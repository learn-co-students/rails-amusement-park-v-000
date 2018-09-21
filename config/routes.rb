Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/sessions/destroy", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
  resources :attractions
  resources :users
end
