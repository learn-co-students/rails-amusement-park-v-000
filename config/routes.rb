Rails.application.routes.draw do

 get '/users/new', to: 'users#new', as: "signup"
 post '/users/new', to: 'users#create'
 get 'users/:id', to: 'users#show', as: 'user'
 post 'users/:id', to: 'users#update', as: "edit_user"

 get '/signin', to: 'sessions#new'
 post '/signin', to: 'sessions#create'
 post '/signout', to: 'sessions#destroy'

 post '/attractions/new', to: 'attractions#create'

 resources :attractions

 root 'welcome#home'
end
