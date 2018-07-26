Rails.application.routes.draw do

  root 'application#main'

  namespace :admin do
    resources :stats, only: [:index]
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:show, :index]

  post '/logout' => 'sessions#destroy'



end
