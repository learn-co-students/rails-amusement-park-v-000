Rails.application.routes.draw do
  root "welcome#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/attractions/show", to: "rides#new"
  resources :users
  resources :attractions
end
