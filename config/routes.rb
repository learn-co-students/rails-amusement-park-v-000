Rails.application.routes.draw do

  resources :users
  resources :attractions

  get '/login', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
