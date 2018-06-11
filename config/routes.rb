Rails.application.routes.draw do
  root 'sessions#index'

  get '/secrets' => 'secrets#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resource :sessions, only: [:new]
  resources :users
  resources :attractions

end
