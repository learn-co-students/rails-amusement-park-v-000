Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'
  # get 'users_controller/new'
  # get '/session', to: 'users#delete'
  # get '/signin', to: ''
  resources :users
  resources :sessions, only: %i[new destroy]
  delete '/session', to: 'sessions#destroy'
end
