Rails.application.routes.draw do
  # get 'rides/new'
  # get 'rides/create'
  # get 'attractions/new'
  # get 'attractions/create'
  # get 'attractions/edit'
  # get 'attractions/update'
  # get 'attractions/destroy'
  # get 'attractions/index'
  # get 'attractions/show'
  root 'application#home'
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'
  post "/rides/new", to: "rides#new"

  resources :attractions
  resources :rides
  resources :users

end
