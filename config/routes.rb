Rails.application.routes.draw do

  root 'application#hello'
   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   delete '/signout' => 'sessions#destroy'

   resources :users
   resources :attractions
   resources :rides, only: [:new, :create]

end
