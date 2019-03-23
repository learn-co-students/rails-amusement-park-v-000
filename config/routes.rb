Rails.application.routes.draw do
  
  root 'static#homepage'
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/sessions/delete', to: 'sessions#destroy'
  get '/sessions/delete', to: 'sessions#destroy'
  resources :rides
  resources :attractions
  resources :users

end
