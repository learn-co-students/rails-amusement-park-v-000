Rails.application.routes.draw do
  root 'welcome#home'
  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
 
  resources :attractions do
    resources :rides
  end 
end