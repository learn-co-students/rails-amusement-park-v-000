Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  namespace :admin do
    resources :attractions
    post '/logout' => "sessions#destroy"
  end

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/signup' => "users#new"
  post '/signup' => "users#create"



  root 'users#home'
end
