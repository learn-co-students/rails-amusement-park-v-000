Rails.application.routes.draw do


  root 'welcome#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post 'users/new', to: 'users#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, :attractions
end
