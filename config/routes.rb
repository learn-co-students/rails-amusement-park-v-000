Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:show, :index]

  post '/logout' => 'sessions#destroy'

  root 'users#index'

end
