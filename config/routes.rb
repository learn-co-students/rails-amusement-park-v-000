Rails.application.routes.draw do

  root "users#new"
  resources :users
  resources :rides
  resources :attractions

  get '/signin' => "users#login"
  get '/logout' => "uses#logout"
end
