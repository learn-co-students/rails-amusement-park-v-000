Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/rides/create', to: 'rides#create'

end
