Rails.application.routes.draw do
  resources :users
  root 'users#new'
  get '/signin', to: 'users#signin'
  post '/login', to: 'users#login'
end
