Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root "static#home"
 resources :users, only: [:new, :create, :show]


  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users', to:'users#index', as: 'users'
  # post '/users', to:'users#create'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

 resources :attractions

#session
 get '/signin', to: 'session#new'
 post '/signin', to: 'session#create'
 delete '/session', to: 'session#destroy'

 post '/rides', to: 'rides#create'
end
