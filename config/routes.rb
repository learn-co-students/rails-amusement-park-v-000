Rails.application.routes.draw do
  
  #get 'user/new'
  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users 
  resources :attractions
end
