Rails.application.routes.draw do
  
  
  root 'static_pages#home'  
  
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create', as: 'session' 
  delete '/signout', to: 'sessions#destroy' 
  
  post '/rides/new', to:"rides#new"
  
  resources :users
  resources :attractions



end
