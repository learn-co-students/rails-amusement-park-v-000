Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions

  get '/signin', to: 'users#login'

  root 'users#welcome'
end
