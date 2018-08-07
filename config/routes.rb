Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy]
  resources :attractions
  resources :rides, only: [:create]
  resources :admin, only: [:show]

  root 'application#welcome'
  
end
