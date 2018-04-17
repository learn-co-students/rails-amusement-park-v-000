Rails.application.routes.draw do
root 'welcome#home'
get 'signin', to: 'sessions#new'
get 'logout', to: 'sessions#destroy'
post 'signin', to: 'sessions#create'
post '/users/:id', to: 'users#ride'
post '/rides/new', to: 'rides#new', as: 'ride'

resources :attractions
resources :users


end