Rails.application.routes.draw do
  
  
  
   
  # get '/static_pages/home', to: 'static_pages#home'
  root 'static_pages#home'  
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'  
  delete '/signout', to: 'sessions#destroy' 
  post '/rides', to:"rides#create", as: 'rides'
  
  resources :attractions
  resources :users
  
  # get '/users/new', to: 'users#new', as: 'new_user'	  
   # get '/users', to:'users#index', as: 'users'	
  # post '/users', to:'users#create'	
  # get '/users/:id', to: 'users#show', as: 'user'	
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'	
  # get '/attractions', to: 'attractions#index', as: 'attractions'	
    # get '/attractions/new', to: 'attractions#new', as: 'new_attraction'	
  # get '/attractions/:id', to: 'attractions#show', as: 'attraction'	
  # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'	
  # patch '/attractions/:id', to: 'attractions#update'	
  # post '/attractions', to: 'attractions#create'	
  
  
  
  
end
