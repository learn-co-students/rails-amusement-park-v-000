Rails.application.routes.draw do

  root 'static#home'

  resources :users

end
