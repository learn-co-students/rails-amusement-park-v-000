Rails.application.routes.draw do

  root 'user#welcome'

  resources :users
  resources :attractions
  resources :rides, only: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
