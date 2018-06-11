Rails.application.routes.draw do
  root 'welcome#home'
  # resources :welcome, only: [:home]

  resources :sessions, only: [:create, :new, :destroy]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :attractions do
    resources :rides
  end 
end