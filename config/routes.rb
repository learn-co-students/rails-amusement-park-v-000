Rails.application.routes.draw do
  
  root 'static_pages#home'

  resources :users
  resources :attractions
  resources :rides
  resources :sessions, only: [:create, :destroy]

  get '/signin', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'

end
