Rails.application.routes.draw do
  root 'application#home'
  
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :attractions
  resources :users
end