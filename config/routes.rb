Rails.application.routes.draw do
  get 'rides/create'
  root 'application#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :rides, only: [:create]
  resources :users, only: [:index, :new, :create, :show]
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
