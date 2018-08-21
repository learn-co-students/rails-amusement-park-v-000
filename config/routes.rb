Rails.application.routes.draw do

  resources :attractions
  resources :rides
  resources :users

  # root 'static_pages#home'
  root 'users#new'
  # root :to => 'houses#index'



end
