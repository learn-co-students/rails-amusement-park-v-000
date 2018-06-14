Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  root 'application#welcome'
  post 'rides/new', to: 'rides#new'
  resources :users
  resources :attractions
  
end
