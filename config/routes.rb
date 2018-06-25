Rails.application.routes.draw do
  root 'application#index'
  resources :users
  resources :attractions
  resources :sessions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'
end
