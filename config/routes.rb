Rails.application.routes.draw do
<<<<<<< HEAD
  root 'static#index'

  # Users Controller Routes
  resources :users

  # Sessions Controller Routes
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"

  # Attractions Controller Routes
  resources :attractions

  # Rides Controller Routes
  post '/rides' => "rides#create"
=======
  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static_pages#home'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'
  post '/attractions', to: 'attractions#create'
  post '/rides', to:"rides#create", as: 'rides'
>>>>>>> refs/remotes/origin/master
end
