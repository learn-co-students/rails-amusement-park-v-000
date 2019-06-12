Rails.application.routes.draw do
  get 'users_controller/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  # get '/', to: 'application#home'

  root 'application#home'
end
