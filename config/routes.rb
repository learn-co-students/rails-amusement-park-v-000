Rails.application.routes.draw do

  root "welcome#home"

  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides, only: [:create]

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
