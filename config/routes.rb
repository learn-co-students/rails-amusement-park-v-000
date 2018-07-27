Rails.application.routes.draw do

  root 'users#welcome'
  resources :sessions
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  get '/' => 'users#update'
  delete 'logout' => 'sessions#destroy'

end
