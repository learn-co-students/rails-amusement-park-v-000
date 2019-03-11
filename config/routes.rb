Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'application#home'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
end
