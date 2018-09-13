Rails.application.routes.draw do
  get 'rides/create'
  resources :users, only: [:new, :create, :show, :index]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  resources :attractions

  resources :rides, only: [:create]

  root 'users#new'

end
