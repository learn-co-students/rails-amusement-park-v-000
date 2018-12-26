Rails.application.routes.draw do
  root 'users#new'
  resources :attractions
  resources :rides
  resources :users
end
