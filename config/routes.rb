Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :sessions
  resources :rides

  root "static_pages#home"

  get 'signin', to: 'sessions#new'

  get '/logout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#new'
end
