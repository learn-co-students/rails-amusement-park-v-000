Rails.application.routes.draw do

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  resources :users
  resources :attractions

  root 'welcome#hello'
end
