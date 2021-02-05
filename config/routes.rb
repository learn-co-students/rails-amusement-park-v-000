Rails.application.routes.draw do
  get 'attractions/index'
  get 'attractions/show'
  get 'attractions/new'
  get 'welcome/home'
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'signin', to: 'sessions#new'
  resources :sessions, only: [:create]
  get 'logout', to: 'sessions#destroy'
  resources :attractions
  post 'attractions/ride', to: 'attractions#ride'
end
