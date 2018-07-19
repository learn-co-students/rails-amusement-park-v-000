Rails.application.routes.draw do



  resources :users
  resources :attractions
  resources :rides, only: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  root 'user#welcome'
end
