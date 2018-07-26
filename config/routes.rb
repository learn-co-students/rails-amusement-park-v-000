Rails.application.routes.draw do

  root 'application#main'

  namespace :admin do
    resources :stats, only: [:index]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:show, :index]

  post '/logout' => 'sessions#destroy'



end
