Rails.application.routes.draw do
  # get 'attractions/index'
  resources :users
  resources :attractions, only: [:new, :create, :index]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :ride, to: 'rides#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 
  # get '/attractions', to: 'attractions#index'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  root 'users#home'
end
