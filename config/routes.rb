Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides 
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'application#home'
end
