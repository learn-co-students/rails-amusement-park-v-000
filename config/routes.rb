Rails.application.routes.draw do
  
  root "application#welcome"
  
  resources :users
  resources :attractions
  post '/signup', to: "users#create"
  get '/signin', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  post '/attractions/:id', to: "attractions#update"
end
