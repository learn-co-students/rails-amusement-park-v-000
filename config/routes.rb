Rails.application.routes.draw do
  root 'sessions#home'
  # get 'attractions/index'
  # get 'attractions/new'
  # get 'attractions/edit'
  # get 'attractions/delete'
  # get 'attractions/show'
  # get 'users/new' => 'users#new'
  # get 'users/:id' => 'users#show'
  resources :users
  resources :attractions
  resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'users#destroy'
  patch '/users/update' => 'users#update'
end
