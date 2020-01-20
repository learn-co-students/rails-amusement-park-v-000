Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  resources :users, only: [:new, :create, :show]
  resources :attractions 
  
  get    '/signin',   to: 'sessions#new' 
  post   '/signin',   to: 'sessions#create', as: :create_session
  delete '/logout',  to: 'sessions#destroy'
end
