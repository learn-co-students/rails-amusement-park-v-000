Rails.application.routes.draw do
  # get 'attractions/index'
  resources :users
  resources :attractions, only: [:new, :create, :index, :edit]
  # resources :sessions, only: [:new, :create, :destroy]
  resources :ride, to: 'rides#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 
  patch '/attractions/:id', to: 'attractions#update', as: 'update'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  root 'users#home'
end
