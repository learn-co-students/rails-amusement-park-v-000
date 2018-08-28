Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  get '/rides/new' => 'rides#new'
  resources :attractions
  resources :users

end
