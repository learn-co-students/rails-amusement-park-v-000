Rails.application.routes.draw do
  resources :users, only: [:show]
  get '/signin', to: "session#new"
  post '/signin', to: "session#create"
  root "users#new"
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

end
