Rails.application.routes.draw do
  root 'welcome#home'
  # resources :welcome, only: [:home]

  resources :sessions, only: [:create, :new, :destroy]

  get '/users/new', to: 'users#new', as: "signup"
  # post '/users', to: 'users#create'
  get '/signin', to: 'sessions#new', as: "signin"
  get '/login', to: 'sessions#new', as: "login"
  # post '/signin', to: 'sessions@create'
  get '/logout', to: 'sessions#destroy'

  
  resources :users # this is extra, since adding the post routes above? 

  resources :attractions do
    resources :rides
  end 
end