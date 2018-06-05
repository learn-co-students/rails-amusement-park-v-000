Rails.application.routes.draw do
  
  
   
  

  # resources :users
  
  get '/users/new', to: 'users#new', as: 'new_user'	  
  get '/static_pages/home', to: 'static_pages#home'
  root 'static_pages#home'	
  get '/users', to:'users#index', as: 'users'	
  post '/users', to:'users#create'	
  get '/users/:id', to: 'users#show', as: 'user'	
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'	
  # get '/attractions', to: 'attractions#index', as: 'attractions'	
  get '/signin', to: 'sessions#new', as: 'signin'	
  post '/session', to: 'sessions#create', as: 'session'	
  delete '/session/', to: 'sessions#destroy'	
  # get '/attractions/new', to: 'attractions#new', as: 'new_attraction'	
  # get '/attractions/:id', to: 'attractions#show', as: 'attraction'	
  # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'	
  # patch '/attractions/:id', to: 'attractions#update'	
  # post '/attractions', to: 'attractions#create'	
  post '/rides', to:"rides#create", as: 'rides'
  
  resources :attractions
  
end
