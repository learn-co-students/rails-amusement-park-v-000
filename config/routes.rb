Rails.application.routes.draw do
  get 'attractions/index'
  resources :users
  # resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy' 
  get '/attractions', to: 'attractions#index'
  root 'users#home'
end
