Rails.application.routes.draw do
  root 'application#home'
  resources :rides
  resources :users
  resources :attractions
  resources :sessions, only: [:create, :destroy]

  post '/logout' => 'sessions#destroy'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
