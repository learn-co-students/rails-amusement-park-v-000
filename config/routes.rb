Rails.application.routes.draw do

  root 'static#home'
  get 'static/login'
  get 'static/signup' => 'users#new'
  get 'static/logout'

  resources :users, only:[:show, :new, :create, :destroy, :edit, :update]

end
