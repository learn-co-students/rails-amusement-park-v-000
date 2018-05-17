Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
