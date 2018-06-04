Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides

  root 'welcome#home'

end
