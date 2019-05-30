Rails.application.routes.draw do
  root 'application#home'
  resources :rides
  resources :users
  resources :attractions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
