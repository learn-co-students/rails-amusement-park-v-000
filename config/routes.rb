Rails.application.routes.draw do

  root 'application#home'

  
  get '/signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'

  resources :users
  resources :attractions
  resources :rides 

end
