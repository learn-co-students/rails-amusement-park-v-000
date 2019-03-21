Rails.application.routes.draw do

  get 'sessions/new'
  get 'welcome/home'
  get 'users/new'

  root 'welcome#home'

  resources :users, only: [:show, :new, :create]

  get '/signup', to: "sessions#new"
  get '/signin', to: "sessions#create"
  get '/logout', to: "sessions#logout"

end
