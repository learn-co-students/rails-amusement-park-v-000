Rails.application.routes.draw do

resources :attractions

get 'rides/create'
get 'sessions/new'
get 'users/new', to: 'users#new'
post '/users', to: 'users#create'
root 'static_pages#home'
get 'users/:id', to: 'users#show', as: 'user'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
delete '/sessions/', to: 'sessions#destroy'
post '/rides', to:"rides#create", as: 'rides'
end
