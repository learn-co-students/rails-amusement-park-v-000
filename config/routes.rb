Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  resources :rides
  resources :sessions, only: [:create, :destroy]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

end
