Rails.application.routes.draw do

  root 'application#index'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  post 'signout', to: 'sessions#destroy'

  resources :users
end
