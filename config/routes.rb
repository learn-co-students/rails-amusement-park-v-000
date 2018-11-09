Rails.application.routes.draw do

  root :to => "site#welcome"
  
  resources :rides
  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'
end
