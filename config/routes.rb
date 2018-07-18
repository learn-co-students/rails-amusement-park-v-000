Rails.application.routes.draw do
  root "static#home"
  resources :attractions
  resources :users
  resources :rides, only: [:update]
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
