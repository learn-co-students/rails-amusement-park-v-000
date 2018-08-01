Rails.application.routes.draw do
  resources :users
  #get '/users/:id', to: 'users#show', as: 'user'

  get '/signin', to: 'sessions#new'
  root 'users#home'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new'

  resources :attractions
end
