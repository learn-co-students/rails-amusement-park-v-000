Rails.application.routes.draw do
  root "static_pages#home"
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
end
