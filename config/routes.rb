Rails.application.routes.draw do  

  get 'rides/create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'  

  root 'users#new'

  get '/signup' => 'users#new'
  post '/' => 'users#create'


  resources :users, only: [:new, :create, :show, :update]

  resources :attractions, only: [:index, :show]

  resources :attractions do
    resources :users, only: [:update]
  end
  
end
