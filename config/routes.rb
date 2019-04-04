Rails.application.routes.draw do

  root 'users#home'
  resources :users
  resources :attractions
  #resources :sessions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/ride' => 'rides#create'

end
