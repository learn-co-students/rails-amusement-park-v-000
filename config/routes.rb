Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

get '/takeride', to: 'rides#takeride'
end
