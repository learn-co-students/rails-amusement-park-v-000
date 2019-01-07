Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'static#signin'
  get '/signup' => 'users#new'
  get '/logout' => 'static#logout'

  resources :users, only:[:new, :create, :show, :edit, :update, :destroy]

end
