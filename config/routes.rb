Rails.application.routes.draw do
  resources :users
  resources :attractions
  root "static#home"
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
  post '/rides/new' => 'rides#new'
end
