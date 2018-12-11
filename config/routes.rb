Rails.application.routes.draw do
  get 'welcome/home'
  resources :users

  get '/auth/facebook/callback' => 'sessions#create'

  root 'welcome#home'
end
