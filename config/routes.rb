Rails.application.routes.draw do
  root 'application#home'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions
  resources :attractions
  resources :rides
end
