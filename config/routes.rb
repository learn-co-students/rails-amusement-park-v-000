Rails.application.routes.draw do
  root 'welcome#home'
    
  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides, only: [:new, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
end
