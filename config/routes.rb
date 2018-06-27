Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :update]
  resources :attractions
  resources :rides, only: [:create]
  root 'application#home'
  #sessions routes
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #admin flow

end
