Rails.application.routes.draw do

  root 'welcome#home'
  resources :rides
  resources :attractions
  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new'
end
