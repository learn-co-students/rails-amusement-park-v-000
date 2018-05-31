Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show]
  resources :rides, only: [:create]

  root 'welcome#home'
end
