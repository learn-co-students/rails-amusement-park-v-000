Rails.application.routes.draw do
  root "welcome#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  resources :users
  resources :attractions
end
