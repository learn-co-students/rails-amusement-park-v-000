Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :sessions, only: [:create, :show, :destroy]
  resources :attractions, only: [:show]

  get '/signin' => 'sessions#new'
  get '/attractions' => 'attractions#index'


end
