Rails.application.routes.draw do
  resources :users
  root 'application#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:create]
end
