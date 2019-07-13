Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "static_pages#home"

get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"

#post '/logout' => 'sessions#destroy'

resources :users

get '/users/:id' => 'users#show'

resources :attractions
resources :rides
resources :sessions

delete '/logout' => 'sessions#destroy'

#get '/users/new' => 'users#new'

end
