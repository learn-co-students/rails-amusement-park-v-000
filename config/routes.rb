Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :show, :index, :edit, :update]

  get '/signin', to: "sessions#new"
  get '/logout', to: "sessions#destroy" 
  post '/rides', to: "attractions#ride"

  post '/sessions', to: "sessions#create"
  
end
