Rails.application.routes.draw do

  root 'application#home'

  
  get '/signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'

  resources :users
  resources :attractions
  resources :rides 

end
