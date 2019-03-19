Rails.application.routes.draw do
  
  root 'application#hello'
  # get '/welcome' => 'users#index'
  # root 'users#new'
  # resources :users, only: [:new, :create, :show]
  get 'users/new' => 'users#new'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/singin' => 'sessions#create'
  # resources :sessions
end
