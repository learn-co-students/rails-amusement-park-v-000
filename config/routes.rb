Rails.application.routes.draw do
  root 'welcome#home'
  resources :users

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
end
