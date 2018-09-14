Rails.application.routes.draw do
  root "application#home"
  resources :rides
  resources :attractions
  resources :users

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
