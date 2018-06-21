Rails.application.routes.draw do

  root 'users#new'

  resources :users, :attractions, :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'
end
