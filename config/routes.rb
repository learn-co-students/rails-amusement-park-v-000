Rails.application.routes.draw do

  get 'sessions/new'
  get 'welcome/home'
  get 'users/new'

  root 'welcome#home'

  resources :users, only: [:show, :new, :create]

  get '/login', to: "sessions#new"
  get '/login', to: "sessions#create"
  get '/logout', to: "sessions#logout"

end
