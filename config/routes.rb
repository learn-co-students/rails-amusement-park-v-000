Rails.application.routes.draw do

  root 'static_pages#index'

  resources :attractions
  resources :rides, only: [:create]
  resources :users

  get '/signin' => 'sessions#new'

  post '/sessions' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  # get '/attractions/:id' => 'attractions#show'
  # get '/attractions/index' => 'attractions#index'
  # get '/attractions' => 'attractions#index'
  # get '/attractions/new' => 'attractions#new'
  # post 'attractions' => 'attractions#create'



end
