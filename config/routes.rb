Rails.application.routes.draw do
  devise_for :users
  get 'rides/new', to: 'rides#new'
  post 'rides/new', to: 'rides#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :attractions
  resources :users
  root 'welcome#index'

  #I am working on this solely because the learn app wont accept my code (even though all tests are passing)
end