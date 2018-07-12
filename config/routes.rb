Rails.application.routes.draw do

  resources :users
  resources :rides
  resources :attractions

  root "welcome#home"

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
