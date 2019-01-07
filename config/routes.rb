Rails.application.routes.draw do

  root 'static#home'
  get '/signin' => 'static#login'
  get '/signup' => 'users#new'
  get '/logout' => 'static#logout'

  resources :users, only:[:new, :create, :show, :edit, :update, :destroy]

end
