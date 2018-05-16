Rails.application.routes.draw do
  
  resources :rides
  resources :users
  resources :attractions

  root 'welcome#home'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy'
end
