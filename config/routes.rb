Rails.application.routes.draw do

  root 'application#home'
# root 'users#new'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :users
  resources :rides
  resources :attractions
end
