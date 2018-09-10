Rails.application.routes.draw do
  #home path
  root 'static_pages#home'

  #session routes
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  # user & attraction routes
  resources :users
  resources :attractions

end
