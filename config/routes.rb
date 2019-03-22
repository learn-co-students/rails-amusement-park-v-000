Rails.application.routes.draw do
  
  root 'application#hello'
  resources :users, only: [:index, :create, :show, :new]
  resources :rides, only: [:create]
  resources :attractions
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  
end
