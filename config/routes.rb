Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/takeride', to: 'rides#takeride'
end
