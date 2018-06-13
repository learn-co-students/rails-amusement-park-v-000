Rails.application.routes.draw do
  get 'rides/new'
  get 'rides/create'
  root 'sessions#index'

  get '/secrets' => 'secrets#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resource :sessions, only: [:new]
  resources :users
  resources :attractions

end
