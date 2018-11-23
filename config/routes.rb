Rails.application.routes.draw do
  root 'static#home'
  resources :users
  get '/signin', to: 'users#signin'
end
