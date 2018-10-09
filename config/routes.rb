Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides




end
