Rails.application.routes.draw do
  
resources :users
get '/signin', to: 'sessions#new'
  
get '/signup', to: 'users#new'
  
post '/signin', to: 'sessions#create'

root 'application#index'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
end
