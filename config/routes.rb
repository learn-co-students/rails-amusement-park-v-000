Rails.application.routes.draw do
  resources :users
  get "/signin" => 'sessions#signin'
  post "/session" => 'sessions#create'
  get "/signout" => 'sessions#destroy'
  root 'application#hello'

  resources :attractions

  post "/rides" => 'rides#create'
end
