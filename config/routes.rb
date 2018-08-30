Rails.application.routes.draw do
  root 'layouts#application'
  get '/signin' => 'sessions#new'
  post '/signin' => 'users#show'
  delete '/logout' => 'sessions#destroy'
  resources :users
  resources :attractions
  resources :rides
  resources :sessions
end
