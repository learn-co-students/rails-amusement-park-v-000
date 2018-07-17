Rails.application.routes.draw do
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/users/new' => 'users#new'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'
  post '/take_ride' => 'users#ride'
end
