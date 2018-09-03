Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'

  resources :users

end
