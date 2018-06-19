Rails.application.routes.draw do

  root 'users#index'
  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get  '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'


  resources :attractions
  resources :users
end
