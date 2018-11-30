Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides, only: [:new, :create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'


  root 'application#index'
end
