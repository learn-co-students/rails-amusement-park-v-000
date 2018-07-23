Rails.application.routes.draw do

  resources :users
  resources :attractions
  resources :sessions, only: [:new, :create, :destroy]

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  post '/rides', to: 'rides#ride', as: 'ride'
  post "/rides/new" => 'rides#new'

  root 'static#welcome'
end
