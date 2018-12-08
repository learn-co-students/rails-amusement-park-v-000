Rails.application.routes.draw do
  resources :users
  root 'users#welcome'
  get  '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :attractions
  post '/rides' => 'rides#create'
end
