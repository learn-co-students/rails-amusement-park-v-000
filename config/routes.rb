Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'users#home'

resources :users
resources :sessions, only: [:new, :create, :destroy]

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'


post 'users' => 'users#create'

resources :foods
resources :catalog

#resources :desserts

end
