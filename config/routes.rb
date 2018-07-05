Rails.application.routes.draw do
  root 'welcome#welcome'
  resources :attractions, except: [:destroy]
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
