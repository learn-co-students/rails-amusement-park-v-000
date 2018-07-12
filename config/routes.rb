Rails.application.routes.draw do
  root 'layouts#application'
  get '/signin' => 'sessions#new'
  # get '/login' => 'sessions#new'
  # post '/login' => 'secrets#show'
  # post '/logout' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'
  resources :users
  resources :attractions
  resources :sessions
end
