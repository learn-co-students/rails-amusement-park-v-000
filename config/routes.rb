Rails.application.routes.draw do

  resources :attractions
  resources :rides
  resources :users
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/take_ride' => 'users#ride'

end
