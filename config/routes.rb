Rails.application.routes.draw do
  resources :users, only: [:show]
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  root 'users#new'
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

end
