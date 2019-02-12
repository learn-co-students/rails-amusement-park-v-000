Rails.application.routes.draw do
  root 'application#home'
  resources :users, only: [:new, :create, :show]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  resources :attractions
  post '/rides/new' => 'rides#new'
end
