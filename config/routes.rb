Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :attractions
  resources :rides
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/session/delete' => 'sessions#delete'
end
