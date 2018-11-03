Rails.application.routes.draw do
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  root 'static#home'
  delete "/signout", to: "sessions#destroy"
  post '/rides/new', to: "rides#new"
end
