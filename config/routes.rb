Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static_pages#home'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
end
