Rails.application.routes.draw do
  root "static_pages#home"
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post 'users/new', to: 'users#create'
  get '/logout', to: 'sessions#destroy'
  get '/rides/new', to: 'rides#new'
  post '/rides/create', to: 'rides#create'
  
  resources :users, :attractions
end
