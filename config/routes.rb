Rails.application.routes.draw do
  root 'static#home'

  resources :attractions
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :rides, only: [:create]
  resources :sessions, only: [:create]

  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
end
