Rails.application.routes.draw do
  root 'welcome#home'
  resources :rides
  resources :users
  resources :attractions


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


end
