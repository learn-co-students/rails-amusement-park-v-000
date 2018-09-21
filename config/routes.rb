Rails.application.routes.draw do
  
  resources :attractions
  resources :rides
  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  root 'welcome#home'

end
