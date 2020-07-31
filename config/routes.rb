Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :attractions
  resources :sessions, only: [:create, :destroy]
  get '/signin', to: 'sessions#new'

  root 'attractions#index'
end
