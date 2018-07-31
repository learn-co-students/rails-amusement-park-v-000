Rails.application.routes.draw do

  root "welcome#home"
  resources :attractions
  resources :users

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"
  get '/', to: "welcome#home"
  post '/rides/new', to: "attractions#ride"

end
