Rails.application.routes.draw do

  # resources :rides
  resources :attractions
  resources :users

   # root :to => "users#new"
  root :to => "application#home"

   get '/signin', to: 'sessions#signin'
   post '/signin', to: 'sessions#create'

   post '/logout', to: 'sessions#destroy'
   get '/go', to: 'attractions#go'
end
