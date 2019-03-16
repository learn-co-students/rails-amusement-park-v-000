Rails.application.routes.draw do
  root 'application#home'
  resources :users
  get '/signin', to: 'sessions#sign_in'
  post '/signin', to: 'sessions#create'

end
