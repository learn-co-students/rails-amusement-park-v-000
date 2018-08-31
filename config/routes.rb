Rails.application.routes.draw do
  root to: 'application#welcome'

  resources :users, only: [:new, :create, :show]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  resources :attractions, only: [:new, :create, :show, :index]
end
