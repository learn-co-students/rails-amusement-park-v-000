Rails.application.routes.draw do

  root "application#welcome"
  resources :users
  resources :rides
  resources :attractions

  get '/signin' => "users#login"
  get '/logout' => "users#logout"
end
