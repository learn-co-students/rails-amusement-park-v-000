Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions
  resources :sessions, only: [:new, :create]

  root to: 'application#home'

  get '/signin', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
end
