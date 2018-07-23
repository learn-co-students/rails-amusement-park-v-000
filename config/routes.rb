Rails.application.routes.draw do

  root 'users#welcome'
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  post '/ride' => 'attractions#ride'


end
