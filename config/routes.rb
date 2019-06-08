Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :sessions
  resources :attractions

  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get '/attractions/:id/ride' => 'rides#ride'
  
end