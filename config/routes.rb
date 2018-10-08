Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]

  get '/go_on_ride', :to => 'attractions#go_on_ride'
  get '/signin', :to => 'sessions#new'
  get '/logout', :to => 'sessions#destroy'

  root to: 'welcome#home'
end
