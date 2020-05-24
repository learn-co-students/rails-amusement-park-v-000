Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users
root 'users#home'
get '/signin', to: 'users#signin'
post '/login', to: 'users#login'
get '/logout', to: 'users#destroy'

resources :attractions
resources :users

end
