Rails.application.routes.draw do


  root 'users#new'
  resources :users
  resources :attractions


  get '/signin', :to => 'users#signin'
  post '/signin', :to => 'sessions#create'
  get '/logout', :to => 'sessions#logout'
  post '/user_rider', :to => "attractions#user_rider"


end
