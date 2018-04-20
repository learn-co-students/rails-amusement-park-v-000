Rails.application.routes.draw do
  root 'sessions#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index]
end
