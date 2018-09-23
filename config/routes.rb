Rails.application.routes.draw do
  root 'application#home'
  resources :rides
  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
