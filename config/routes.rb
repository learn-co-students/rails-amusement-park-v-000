Rails.application.routes.draw do
  
  resources :attractions
  resources :users
  root 'welcome#home'
  
  get '/signin', to: 'sessions#new'
  get '/signout', to: "sessions#destroy"
  post '/signin', to: 'sessions#create'
  post '/rides', to: 'rides#new'
end
