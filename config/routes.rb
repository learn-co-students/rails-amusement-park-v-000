Rails.application.routes.draw do

  root 'application#main'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/rides/new', :to => 'rides#new'
  post '/rides/new', :to => 'rides#new'

  resources :users
  resources :attractions

end
