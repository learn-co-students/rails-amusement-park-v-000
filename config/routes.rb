Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :welcome, only: [:new, :create]
  resources :rides, only: [:create]

  delete '/logout' => 'welcome#destroy'
  get '/' => 'welcome#home'
  get '/signin' => 'welcome#new'


  root 'welcome#home'
end