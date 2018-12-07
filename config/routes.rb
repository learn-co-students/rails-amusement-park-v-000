Rails.application.routes.draw do
  get 'attractions/new'
  get 'attractions/show'
  get 'attractions/update'
  resources :users
  root 'users#welcome'
  get  '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :attractions
end
