Rails.application.routes.draw do

  # get 'sessions/signin'
  root 'welcome#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post 'users/new', to: 'users#create'
  # get '/login', to: 'sessions#create'
  # get 'users/:id', to: 'users#show'
  # get 'users/show', to: 'users#show'
  resources :attractions
  resources :users
end
