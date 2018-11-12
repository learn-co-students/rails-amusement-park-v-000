Rails.application.routes.draw do
  root "welcome#home"

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users
  
end
