Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'

   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'

   get '/logout' => 'sessions#destroy'


  root 'users#home'

end
