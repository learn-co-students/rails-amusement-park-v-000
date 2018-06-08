Rails.application.routes.draw do
  root "static_pages#home"

  resources :users, only: [:new, :create, :show]

  resources :attractions

  get '/signin', to: 'sessions#new'
  resources :sessions, only: [:create]
  post '/logout' => 'sessions#destroy' 

  post '/rides', to: 'rides#create'
end
