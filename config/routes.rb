Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :attractions

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
end
