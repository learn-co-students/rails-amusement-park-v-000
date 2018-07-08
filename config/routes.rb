Rails.application.routes.draw do

  resources :rides
  resources :users
  resources :attractions

  root 'users#new'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

end
