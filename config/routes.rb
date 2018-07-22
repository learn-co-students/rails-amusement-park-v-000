Rails.application.routes.draw do


  get '/' => 'sessions#welcome'
  post '/logout' => 'sessions#destroy'
  #get 'products/:id' => 'catalog#view'
  resources :users
  get '/signin' => 'users#signin'
  post '/users' => 'users#find'

  resources :rides
  resources :attractions


end
