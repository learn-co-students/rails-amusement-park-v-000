Rails.application.routes.draw do
  root 'users#home'

  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :attractions do
  end


end
