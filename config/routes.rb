Rails.application.routes.draw do
  root 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show, :index]
  resources :attractions
  resources :rides, only: [:create]
end
