Rails.application.routes.draw do
  resources :attractions
  resources :users
  # resources :users do 
  # 	resources :attractions
  # end
  # resources :attractions do 
  # 	resources :users
  # end
  get '/signin', to: 'session#new'
  post '/session/create'
  delete '/session/destroy'
  root 'users#index'
end

