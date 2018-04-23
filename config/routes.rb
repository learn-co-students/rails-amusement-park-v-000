Rails.application.routes.draw do
  root 'static#home'

  get '/signin' => 'sessions#new'
  post '/session' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, except: :destroy
  resources :rides, only: :create
end
