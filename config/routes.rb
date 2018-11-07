Rails.application.routes.draw do

  resources :attractions
  resources :users, only: [:new, :show]
  root 'welcome#home'
  get '/signin': 'sessions#new'
  post '/signin': 'sessions#create'
  delete '/signout': 'sessions#destroy'
  get '/rides/new' => 'rides#new'
  post '/rides/new' => 'rides#create'
end
