Rails.application.routes.draw do
  root 'homepage#home'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/users/:id' => 'users#show'
  get '/logout' => 'sessions#destroy'
  resources :attractions
  resources :users

end
