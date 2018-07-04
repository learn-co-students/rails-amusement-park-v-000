Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:create]

  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root 'welcome#home'
end
