Rails.application.routes.draw do
  root to: 'rides#index'
  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides, only: [:show, :new, :create]
  get '/signin', to: "users#signin"
  post '/signin', to: "users#signedin"
  get '/logout', to: "users#logout"
end
