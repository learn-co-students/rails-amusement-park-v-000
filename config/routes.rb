Rails.application.routes.draw do
   root 'site#home'


  get '/signin' => 'sessions#new'
  

  post '/sessions/new', to: "sessions#create"
  delete '/logout' => 'sessions#destroy'


   post '/rides/new', to: 'rides#new'


  resources :attractions
  resources :users
  resources :rides

end
