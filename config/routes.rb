Rails.application.routes.draw do

  get 'static/login'
  get 'static/signup'
  root 'static#home'

  resources :users

end
