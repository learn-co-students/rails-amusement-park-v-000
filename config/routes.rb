Rails.application.routes.draw do
  
  root 'application#hello'
  resources :users, only: [:index, :create, :show, :new]
  resources :rides
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  resources :attractions
end
