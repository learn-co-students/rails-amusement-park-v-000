Rails.application.routes.draw do
  resources :users
  post "/users/new", to: "users#create"
  root 'users#home'
  get '/signin', to: 'users#login'
  post '/signin', to: 'users#signin'
  get '/logout', to: 'users#destroy'
  post '/ride', to: 'attractions#ride'
  post '/attractions/new', to: 'attractions#create'
  resources :attractions
end
