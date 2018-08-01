Rails.application.routes.draw do
  root :to => 'welcome#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/ride' => 'attractions#ride'
  resources :users
  resources :attractions
end
