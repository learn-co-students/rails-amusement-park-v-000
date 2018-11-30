Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  root 'application#index'
end
