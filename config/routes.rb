Rails.application.routes.draw do

  root 'users#home'
  resources :users
  resources :attractions
  #resources :sessions

  get '/signin' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
