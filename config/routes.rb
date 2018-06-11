Rails.application.routes.draw do

  root 'application#home'

  resources :users
  resources :attractions
  resources :rides
  resources :sessions
  get '/signin' => 'sessions#new'
end