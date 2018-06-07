Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/users/:id', to: 'users#show', as: 'user'

  resources :sessions, only: :create
  get '/signin', to: 'sessions#new'
  root 'users#home'
end
