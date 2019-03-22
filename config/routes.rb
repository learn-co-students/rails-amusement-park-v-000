Rails.application.routes.draw do

  get 'sessions/new'
  get 'welcome/home'
  get 'users/new'

  root 'welcome#home'

  resources :users, only: [:show, :new, :create]

  get '/signup', to: "users#new"
  get '/signin', to: "sessions#new"
  post '/signin', to: "session#create"
  get '/logout', to: "sessions#destroy"

end
