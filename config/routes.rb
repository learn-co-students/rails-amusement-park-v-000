Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'
  post "/rides/new", to: "rides#new"

  resources :attractions

  resources :users

end
