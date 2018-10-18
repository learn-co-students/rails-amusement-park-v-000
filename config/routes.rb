Rails.application.routes.draw do

 
  get 'welcome/home'
  root 'welcome#home'

  
  # get 'attractions/new'
  # get 'users/new'
  resources :rides
  resources :users
  resources :attractions

  get 'signin' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  post '/rides/new' => "rides#new" 
end
