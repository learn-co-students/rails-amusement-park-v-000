Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy'

  root 'static_pages#home'
end
