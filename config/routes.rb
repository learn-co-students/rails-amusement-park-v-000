Rails.application.routes.draw do

  root 'application#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get 'rides/create'
  
  resources :users, only:[:index, :new, :create, :show]
  resources :attractions
  resources :rides, only:[:create]


  
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
