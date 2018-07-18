Rails.application.routes.draw do

  root 'users#new'
  resources :users
  resources :attractions

  resources :rides, only: [:new]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'


end
