Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :signin]
  resources :attractions
  resources :rides

  root 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', via: 'delete'

end	