Rails.application.routes.draw do
  
  
 root 'users#home'
    get '/users' => 'users#new'
  
    post '/users' => 'users#create'

   # get '/users/:id/edit' => 'users#edit'
   # get '/users/:id' => 'users#edit'
   # PATCH '/users/:id' => 'users#update'
   # PUT '/users/:id' => 'users#update'
   # DELETE '/users/:id' => 'users#destroy'
  # get 'users/signup', to: 'users/new'
 
  # resources :sessions
  
   get '/signin', to: 'sessions#new'
   post '/sessions', to: 'sessions#create'
   get '/signout', to: 'sessions#destroy'
   delete '/signout', to: 'sessions#destroy'
   # get '/rides', to: 'rides#new'
  post '/rides', to: 'rides#create'
 
   resources :users
  resources :attractions
  


  
end
  # get '/users/new', to: 'users#new', as: 'new_user'
  # root 'users#home'
  # get '/users', to:'users#index', as: 'users'
  # post '/users', to:'users#create'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/attractions', to: 'attractions#index', as: 'attractions'
  # get '/signin', to: 'session#new', as: 'signin'
  # post '/session', to: 'session#create', as: 'session'
  # delete '/session/', to: 'session#destroy'
  # get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  # get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  # get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  # patch '/attractions/:id', to: 'attractions#update'
  # post '/attractions', to: 'attractions#create'
  # post '/rides', to:"rides#create", as: 'rides'