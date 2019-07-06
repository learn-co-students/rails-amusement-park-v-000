Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:new, :create]

end
