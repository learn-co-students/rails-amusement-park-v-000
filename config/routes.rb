Rails.application.routes.draw do

  resources :rides
  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'sessions#index'

end
