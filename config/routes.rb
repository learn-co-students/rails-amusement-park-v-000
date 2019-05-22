Rails.application.routes.draw do
  root 'application#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :users, only: [:index, :new, :create, :show]
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
