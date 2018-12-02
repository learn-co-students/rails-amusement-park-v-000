Rails.application.routes.draw do

  root 'application#root'

  get '/signin', to: 'users#signin', as: 'signin'
  post '/signin', to: 'users#login' , as: 'login'
  delete '/users/delete', to: 'users#destroy', as: 'delete'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]
end
