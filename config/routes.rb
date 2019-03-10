Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]
resources :rides, only: [:new, :create, :show]
resources :attractions 


   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'
   get '/attractions' => 'attractions#home'

  root 'users#home'

end
