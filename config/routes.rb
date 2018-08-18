Rails.application.routes.draw do

  root 'application#main'

  namespace :admin do
    resources :stats, only: [:index]
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'


  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:index, :new, :show, :edit]

  post '/logout' => 'sessions#destroy'



end
