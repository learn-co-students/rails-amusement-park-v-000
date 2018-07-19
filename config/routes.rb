Rails.application.routes.draw do
  get 'site/index'
  resources :users
  resources :attractions
  resources :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'site#index'
end
