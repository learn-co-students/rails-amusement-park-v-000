Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  resources :users
  resources :attractions
end
