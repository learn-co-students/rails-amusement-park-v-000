Rails.application.routes.draw do

  get 'attractions/index'
  get 'attractions/show'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/edit'
  get 'attractions/update'
  get 'attractions/destroy'
  root 'static#home'
  get '/signin' => 'static#signin'
  post '/login' => 'static#login'
  get '/signup' => 'users#new'
  get '/logout' => 'static#logout'

  resources :users, only:[:new, :create, :show, :edit, :update, :destroy]
  resources :attractions

end
