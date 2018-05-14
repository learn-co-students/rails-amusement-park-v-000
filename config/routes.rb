Rails.application.routes.draw do
  root 'sessions#new'
  get    '/signin',   to: 'sessions#new'
  post   '/signin', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :rides
  resources :attractions
  resources :users
  

end
