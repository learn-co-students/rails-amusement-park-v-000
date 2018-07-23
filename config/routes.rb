Rails.application.routes.draw do
  root to: 'static#new'
 resources :attractions
 resources :users
 resources :rides
 get '/signin', to: 'sessions#new'
 post '/signin', to: 'sessions#create'
 get '/logout', to: 'users#destroy'
 post '/logout', to: 'users#destroy'
end
