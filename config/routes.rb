Rails.application.routes.draw do

  root 'sessions#welcome'

  #signup
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  #login

  #logout
  delete '/logout' => 'sessions#destroy'
  
  resources :sessions
  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides

end
