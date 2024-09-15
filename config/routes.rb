Rails.application.routes.draw do
  get 'attractions/index'
  root "sessions#index"

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :show, :create]

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :rides
end
