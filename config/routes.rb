Rails.application.routes.draw do
  root 'static#index'

  # Users Controller Routes
  resources :users

  # Sessions Controller Routes
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"

  # Attractions Controller Routes
  resources :attractions

  # Rides Controller Routes
  post '/rides' => "rides#create"
end
