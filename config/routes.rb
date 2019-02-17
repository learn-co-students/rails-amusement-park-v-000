Rails.application.routes.draw do
  root 'application#home'
  resources :users
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :attractions
  post '/users/:id', to: 'users#show'
end
