Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post '/users/ride', to: 'users#ride'

  resources :users

  resources :attractions
end
