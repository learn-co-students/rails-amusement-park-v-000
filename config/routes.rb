Rails.application.routes.draw do
  root "welcome#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: 'sessions#create'
  delete "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
  resources :attractions
  resources :users
end

