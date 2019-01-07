Rails.application.routes.draw do

  root 'static#home'
  get 'static/login'
  get 'static/signup'

  resources :users

end
