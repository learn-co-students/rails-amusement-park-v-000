Rails.application.routes.draw do

  get 'site/welcome'
  root :to => "site#welcome"
  post '/rides/new', :to => "rides#new"
  get '/signin', :to => "sessions#new", as: "signin"
  post '/sessions/login', :to => "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  resources :rides
  resources :attractions
  resources :users
end
