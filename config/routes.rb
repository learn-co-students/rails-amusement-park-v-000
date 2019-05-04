Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'

  resources :users, only: [:new, :show, :create]
  

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'





end
