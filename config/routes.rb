Rails.application.routes.draw do

  root 'welcome#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/rides' => 'rides#new'
  post '/rides' => 'rides#create'

  resources :users, only: [:new, :create, :show]
  resources :attractions
end
