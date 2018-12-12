Rails.application.routes.draw do

  get 'attractions/index'
  resources :users
  resources :attractions

  get 'welcome/home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#home'
end
