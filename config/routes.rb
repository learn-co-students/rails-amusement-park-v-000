Rails.application.routes.draw do
  root 'users#new'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  resources :attractions
  resources :users
end
