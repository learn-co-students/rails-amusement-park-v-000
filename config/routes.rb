Rails.application.routes.draw do
    root :to => "site#welcome"
  resources :users 
  resources :rides
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/rides/new', :to => "rides#new"

end
