Rails.application.routes.draw do
  root 'welcome#home'
 
  get '/signin', to: 'sessions#new', as: "signin"
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  
  resources :users

  resources :attractions 
end