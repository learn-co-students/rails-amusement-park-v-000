Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  root 'welcome#index'

  resources :attractions
  resources :rides, only: [:create]
end
