Rails.application.routes.draw do
  resources :users
  #resources :sessions

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root "application#home"
end
