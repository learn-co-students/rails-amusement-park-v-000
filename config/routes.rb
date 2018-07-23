Rails.application.routes.draw do
  root 'application#home'
  resources :users
  get '/signin', to: 'sessions#sign_in', as: :signin
  post '/signin', to: 'sessions#create'
end
