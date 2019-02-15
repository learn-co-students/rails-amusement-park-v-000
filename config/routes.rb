Rails.application.routes.draw do

  get '/signin' => 'sessions#new'

  post '/signin' => 'sessions#create'

  get '/signout' => 'sessions#destroy'


  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :show, :index]
  resources :rides, only: [:new, :create, :show, :index]

  root 'users#index'

end
