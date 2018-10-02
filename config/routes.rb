Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides
  resources :sessions, only: [:create, :destroy]
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'


end
