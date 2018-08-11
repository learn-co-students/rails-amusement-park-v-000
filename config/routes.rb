Rails.application.routes.draw do

  resources :users
  root "welcome#home"
  get '/signin', to: 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
