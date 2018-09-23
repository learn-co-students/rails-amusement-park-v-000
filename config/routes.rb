Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show]
  resources :attractions
  root 'application#index'

  get "/signin" => 'sessions#new'
  post "/signin"  => 'sessions#create'
  delete "logout"  => 'sessions#destroy'
  post "/rides/new" => 'rides#new'
end
