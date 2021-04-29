Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create]  
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end
