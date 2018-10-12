Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]
  get '/signin', to: "sessions#new"
  post '/sessions', to: "sessions#create"
  
end
