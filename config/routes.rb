Rails.application.routes.draw do

  get 'attractions/index'
  get 'attractions/create'
  get 'attractions/new'
  get 'attractions/edit'
  get 'attractions/show'
  get 'attractions/update'
  get 'attractions/destroy'
  get 'sessions/new'
  get 'welcome/home'
  get 'users/new'

  root 'welcome#home'

  resources :users, only: [:show, :new, :create]
  resources :attractions

  get '/signup', to: "users#new"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

end
