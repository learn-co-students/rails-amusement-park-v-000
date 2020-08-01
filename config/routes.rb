Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  resources :attractions
  resources :rides, only: [:create]
  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root 'static#home'
end
