Rails.application.routes.draw do  

  post 'rides/create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'  

  root 'users#new'

  get '/signup' => 'users#new'
  post '/' => 'users#create'


  resources :users, only: [:new, :create, :show]

  

  resources :attractions, except: [:destroy] do
    resources :users, only: [:update]
  end  
  
end
