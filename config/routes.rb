Rails.application.routes.draw do
  root 'users#new'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  resources :attractions
  resources :rides
  resources :users
end
