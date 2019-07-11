Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "static_pages#home"

get "/signin", to: "sessions#new"

resources :users
resources :attractions
resources :rides

#get '/users/new' => 'users#new'

end
