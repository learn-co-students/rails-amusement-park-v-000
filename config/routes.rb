Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :attractions

  get '/signin' => 'sessions#new', as: :signin
  post 'sessions/create' => 'sessions#create'
  delete "/signout", to: "sessions#destroy"

  post "/rides/new", to: "rides#new"

  root to: 'application#home'
end
