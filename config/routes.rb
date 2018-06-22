Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :sessions


  root "static_pages#home"

  get 'signin', to: 'sessions#new'
end
