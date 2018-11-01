Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
   get '/go_on_ride', :to => 'attractions#go_on_ride'
  get '/signin', :to => 'sessions#new'
  post '/signin', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
end
