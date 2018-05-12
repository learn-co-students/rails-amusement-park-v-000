Rails.application.routes.draw do
  resources :users
  resources :attractions
  #resources :sessions

  root :to => 'sessions#new'
  get '/signup', to: 'users#new'
  get '/signin' => 'sessions#new'
  post '/session' => 'sessions#create', as: 'session'
  get '/logout' => 'sessions#destroy'

  post '/rides/new' => 'rides#new'
end
