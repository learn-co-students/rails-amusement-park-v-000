Rails.application.routes.draw do
  root "static_pages#home"
   resources :users
   resources :attractions

   get '/signin' => "sessions#new"
   post '/signin' => "sessions#create"
   get '/signout' => "sessions#destroy"
   post '/signout'=> "sessions#destroy"
   post '/rides/new' => "rides#new"
 end
