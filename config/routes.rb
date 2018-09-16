Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :attractions
  resources :rides, only: [:new, :create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
