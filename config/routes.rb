Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users

  resources :attractions

  namespace :admin do
    resources :attractions
  end

#  resources :rides
  post '/rides/new' => 'rides#new'
end
