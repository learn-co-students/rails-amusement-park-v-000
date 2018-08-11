Rails.application.routes.draw do


  resources :users
  resources :attractions

  root 'users#new'

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get "/rides/new", to: "rides#new"
  post "/rides/create", to: "rides#create"
end
