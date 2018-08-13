Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  namespace :admin do
    resources :attractions, only: [:new]
  end

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  root 'users#home'
end
