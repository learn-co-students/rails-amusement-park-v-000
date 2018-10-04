Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/users/new', to: 'users#new'
  get '/signin', to: 'sessions#new'

  resources :users
  resources :sessions, only: [:create, :destroy]
  
end
