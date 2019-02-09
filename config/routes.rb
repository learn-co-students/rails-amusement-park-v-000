Rails.application.routes.draw do

  resources :users
  resources :attractions

  post '/users/new', to: 'users#create'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#signin'
end
