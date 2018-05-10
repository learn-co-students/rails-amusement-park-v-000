Rails.application.routes.draw do

  root 'application#welcome'
  
  get 'attractions/new'
  get 'attractions/index'
  get 'attractions/show'
  get 'attractions/create'
	
  resources :users,  only: [:new, :create, :show]

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  post '/rides', to: 'rides#create'
end
