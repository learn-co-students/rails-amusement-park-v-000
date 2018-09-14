Rails.application.routes.draw do
  root "users#new"
  resources :rides, :only => :create
  resources :attractions, :only => [:index, :new, :create, :show, :edit, :update]
  resources :users, :only => [:new, :create, :show, :index]

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
