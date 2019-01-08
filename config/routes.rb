Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'static#signin'
  post '/login' => 'static#login'
  get '/signup' => 'users#new'
  get '/logout' => 'static#logout'

  resources :users, only:[:new, :create, :show, :edit, :update, :destroy]
  resources :attractions

  post 'rides/:user_id/:attraction_id', to: 'rides#create', as: 'rides'
end
