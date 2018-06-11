Rails.application.routes.draw do
  
  
  root 'static_pages#home'  
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/session', to: 'sessions#create'
  post '/rides/new', to:"rides#new"
  get '/rides/:id', to: "users#show"
  get '/rides/new', to: 'rides#create'
  post '/attractions/:id', to: "rides#create"
  delete '/signout', to: 'sessions#destroy' 
  
  
  resources :users
  resources :attractions



end
