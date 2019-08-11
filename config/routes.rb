Rails.application.routes.draw do

  root 'sessions#welcome'
  resources :rides
  resources :attractions
  resources :users

end
