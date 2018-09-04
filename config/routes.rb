Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :attractions
  resources :rides, only: [:create]

  get '/signin', to: "sessions#new"
   get 'logout' => 'sessions#destroy'
  root to: "users#welcome"
end
