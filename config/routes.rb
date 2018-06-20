Rails.application.routes.draw do
  resources :users

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  resources :attractions

  post '/rides/new', to: 'rides#new'

  root 'static#index'
end
