Rails.application.routes.draw do
  root 'users#home'

  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/ride' => 'attractions#ride'
end
