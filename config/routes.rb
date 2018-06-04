Rails.application.routes.draw do
  
  devise_for :users

  resources :users
  resources :sessions
  resources :attractions
end
