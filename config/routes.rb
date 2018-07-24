Rails.application.routes.draw do

  root to: 'users#new'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signin',  to: 'sessions#destroy'
  resources :users, :rides, :attractions
end
