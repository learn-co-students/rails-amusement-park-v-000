Rails.application.routes.draw do

  root 'sessions#index'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/users/:id', to: 'users#show'
  resource :sessions, only: [:new]
  resources :users
  resources :attractions
  get '/rides/new', to: 'rides#new'
  post '/rides/new', to: 'rides#create'
end
