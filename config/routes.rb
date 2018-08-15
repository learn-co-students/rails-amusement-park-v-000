Rails.application.routes.draw do

  root 'welcome#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resources :users
  resources :rides
  resources :attractions
end
