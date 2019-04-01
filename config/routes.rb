Rails.application.routes.draw do
  
  #get 'user/new'
  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: "sessions#create"
  resources :users 
  resources :attractions
end
