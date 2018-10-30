Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :attractions
  resources :rides
  root 'users#new'
   get 'signin' => 'sessions#new'
   get 'logout' => 'sessions#logout'
end
