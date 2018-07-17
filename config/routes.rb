Rails.application.routes.draw do
  resources :attractions
  resources :users, only: [:index, :show]
  root 'application#home'

  get '/signin', to: 'users#new'
  get '/signout', to: 'users#destroy'
end
