Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'

  root 'welcome#home'
end
