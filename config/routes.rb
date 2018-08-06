Rails.application.routes.draw do
  root "welcome#index"

  resources :users
  resources :attractions

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#delete"

  post '/rides/new', to: 'rides#new'

end
