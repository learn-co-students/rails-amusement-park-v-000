Rails.application.routes.draw do
  post 'rides/new', to: "rides#new"
  get 'sessions/new'
  root 'users#home'
  get "/signin", to: "sessions#new"
  post '/sessions/create', to: 'sessions#create'
  delete "/signout", to: "sessions#destroy"
  resources :rides
  resources :users
  resources :attractions
end
