Rails.application.routes.draw do

  root :to => 'users#welcome'

  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]

end
