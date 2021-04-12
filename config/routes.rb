Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/users/new' => 'users#new', as: 'new_user'
  get '/users' => 'users#index', as: 'users'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
 # get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout
  get '/attractions/:id' => 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit' => 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id' => 'attractions#update'
  post '/attractions' => 'attractions#create'
  post '/rides' => "rides#create", as: 'rides'
  get '/signin' => 'session#new', as: 'signin'
  post '/session' => 'session#create', as: 'session'
  delete '/session/' => 'session#destroy'
  resources :users, only: [:new, :show, :create, :edit, :update]
  resources :attractions
end
