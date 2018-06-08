Rails.application.routes.draw do
  root 'welcome#home'
  # resources :welcome, only: [:home]

  resources :sessions, only: [:create, :new, :destroy]

  get '/users/new', to: 'users#new', as: "signup"
  get '/sessions/login', to: 'sessions#new', as: "login"
  get '/logout', to: 'sessions#destroy', as: "logout"
  
  resources :users
  resources :attractions do
    resources :rides
  end 
end