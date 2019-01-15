Rails.application.routes.draw do
  root 'users#new'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  resource :sessions, only: [:create, :destroy]
  resources :attractions
  resources :rides
  resources :users
end
