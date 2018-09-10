Rails.application.routes.draw do
  resources :attractions 
  resources :users
  
  root 'static_pages#home'
  
  

  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  
  post '/rides', to:"rides#create", as: 'rides'
end
