Rails.application.routes.draw do

  resources :rides
  resources :attractions
  resources :users

  root 'sessions#index'

end
