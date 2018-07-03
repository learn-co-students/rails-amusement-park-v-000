Rails.application.routes.draw do
  get '/home' => 'users#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users
  root 'application#index'
end
