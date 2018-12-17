Rails.application.routes.draw do

  root 'welcome#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show]

end
