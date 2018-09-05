Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :sessions, only: [:create, :show, :destroy]

  get '/signin' => 'sessions#new'


end
