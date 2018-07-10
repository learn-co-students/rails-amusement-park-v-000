Rails.application.routes.draw do

  root to: 'application#home'

  get '/signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'

  resources :users
  resources :attractions

end
