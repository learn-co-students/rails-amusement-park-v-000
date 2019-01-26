Rails.application.routes.draw do
  get 'rides/new'
  get '/welcome/home'
  root "welcome#home"
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post 'rides/new', to: 'rides#new'
end
