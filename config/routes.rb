Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'application#home'

get '/signup' => 'users#new'
post '/signup' => 'user#create'

get '/signin' => 'sessions#sign_in'
post '/signin' => 'sessions#create'
post '/signout' => 'sessions#destroy'
post '/ride' => 'rides#create'
# get '/signin', to: 'sessions#sign_in', as: 'signin'
delete '/logout',  to: 'sessions#destroy'
resources :users
resources :attractions
resources :rides
end
