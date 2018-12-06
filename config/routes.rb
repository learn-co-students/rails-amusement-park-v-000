Rails.application.routes.draw do
  root 'welcome#home'
  post '/logout' => 'sessions#destroy'
  resources :users
  resources :rides
  resources :attractions
  resources :sessions
  get '/signin' => 'sessions#signin'

end
