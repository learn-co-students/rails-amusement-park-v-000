Rails.application.routes.draw do
  root 'users#index'
  resources :rides
  resources :attractions
  resources :users
end
