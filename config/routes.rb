Rails.application.routes.draw do
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/users/new' => 'users#new'
  get '/logout' => 'sessions#logout'
  root 'application#home'
  post '/take_ride' => 'users#ride'
end
