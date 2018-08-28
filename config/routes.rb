Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  post '/rides' => 'rides#create'
  resources :attractions
  resources :users

end
