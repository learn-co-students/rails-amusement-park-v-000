Rails.application.routes.draw do

  #resources :rides
  #resources :attractions
  resources :users , only: [:new, :create, :destroy, :show, :index]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  #get '/', to: 'users#new'
  root 'users#new'
  post '/logout', to: 'sessions#destroy'
  #resources :sessions, only: [:index, :show, :destroy ]
end
