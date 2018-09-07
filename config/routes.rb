Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :sessions, only: [:create, :show, :destroy]
  resources :attractions, only: [:show]

  post 'rides/new' => 'rides#new'
  get '/signin' => 'sessions#new'
  get '/attractions' => 'attractions#index'


  #   get "/signin", to: "sessions#new"
  #   post "/sessions/create", to: "sessions#create"
  #   delete "/signout", to: "sessions#destroy"
  #   post "/rides/new", to: "rides#new"
  #   resources :attractions
  #   resources :users

end
