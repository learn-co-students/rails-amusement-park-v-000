Rails.application.routes.draw do
  resources :users
  resources :sessions

  get "/signin", to: "sessions#signin"

  #get "/signin", to: "sessions#signin"
  #get "/signin", to: "sessions#signin"

  root "application#home"
end
