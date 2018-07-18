Rails.application.routes.draw do
  root "static_pages#home"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  post '/rides/new' => 'rides#new'
  resources :users
  resources :attractions
end
