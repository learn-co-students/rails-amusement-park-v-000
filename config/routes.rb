Rails.application.routes.draw do

  get '/' => 'static#home'
  get '/login' => 'static#login'
  get '/signup' => 'users#new'
  get '/logout' => 'static#logout'

  resources :users, only:[:new, :create, :show, :edit, :update, :destroy]

end
