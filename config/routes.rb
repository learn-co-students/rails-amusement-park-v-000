Rails.application.routes.draw do
  root to: 'application#homepage'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :show, :index, :edit, :update]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  post '/rides', to: 'attractions#ride'
end
