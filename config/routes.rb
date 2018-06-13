Rails.application.routes.draw do

  root 'sessions#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resource :sessions, only: [:new]
  resources :users
  resources :attractions
  resource :rides, only: [:new, :create]
end
