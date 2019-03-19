Rails.application.routes.draw do
  
  root 'application#hello'
  # get '/welcome' => 'users#index'
 
  # resources :users, only: [:new, :create, :show]
  get 'users/new' => 'users#new'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  resources :sessions
end
