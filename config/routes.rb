Rails.application.routes.draw do
  root "static_pages#home"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users
  resources :attractions
end
