Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#sign_in'
  get '/signin', to: 'sessions#create'

  resources :users

end
