Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'users#show'
  post '/create' => 'sessions#create'
  root to: 'application#hello'

end
