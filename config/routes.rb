Rails.application.routes.draw do
  root "static_pages#home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users
  resources :attractions
end
