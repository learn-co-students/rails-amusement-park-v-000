Rails.application.routes.draw do
  
  root 'application#index'
  resources :attractions
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get '/signin', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  post '/rides', to: 'rides#ride', as: 'ride'
  
end
