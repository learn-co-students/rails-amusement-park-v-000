Rails.application.routes.draw do
  
  # get '/users/new', to: 'users#new', as: 'new_user' 
  root 'static_pages#home'  
  # get '/users', to:'users#index', as: 'users' 
  # post '/users', to:'users#create'  
  # get '/users/:id', to: 'users#show', as: 'user'  
  # patch '/users/:id/edit', to: 'users#edit', as: 'edit_user'  
  # get '/attractions', to: 'attractions#index', as: 'attractions'  
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create', as: 'session' 
  delete '/signout', to: 'sessions#destroy' 
  # get '/attractions/new', to: 'attractions#new', as: 'new_attraction' 
  # get '/attractions/:id', to: 'attractions#show', as: 'attraction'  
  # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'  
  # patch '/attractions/:id', to: 'attractions#update'  
  # post '/attractions', to: 'attractions#create' 
  post '/rides/new', to:"rides#new"
  
  resources :users
  resources :attractions



end
