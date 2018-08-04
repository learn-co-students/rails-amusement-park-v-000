Rails.application.routes.draw do
  root 'application#welcome'
  resources :rides
  resources :attractions
  resources :users
  resources :admin, only: [:show]
  get '/signin', to: 'sessions#login'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
