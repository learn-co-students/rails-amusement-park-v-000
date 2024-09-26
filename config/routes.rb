Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attractions, only: [:index, :create, :show, :new, :edit, :update]
  resources :rides, only: [:create]
end
