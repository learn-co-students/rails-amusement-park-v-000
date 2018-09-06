Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]
  resources :rides, only: [:create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
