Rails.application.routes.draw do

  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new'

  resources :attractions
  resources :users


end
