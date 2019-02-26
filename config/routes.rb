Rails.application.routes.draw do
  root 'application#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  delete '/signout' => 'sessions#destroy'

  resources :users

  resources :rides
  resources :attractions
end
