Rails.application.routes.draw do
  
  root 'welcome#home'
  resources :users
  resources :attractions
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/go_on_ride' => 'attractions#go_on_ride'
end
