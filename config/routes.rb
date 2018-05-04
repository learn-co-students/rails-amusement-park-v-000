Rails.application.routes.draw do

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin'=>'sessions#create'
  post '/sessions'=>'sessions#create'
  resources :users
  resources :rides
  resources :attractions

end
