Rails.application.routes.draw do

  root 'application#home'
  
  resources :users
  resources :attractions
  resources :rides
  
  get '/signin'=> 'sessions#new'
  post '/login'=> 'sessions#create'
  delete '/logout'=> 'sessions#destroy'
end
