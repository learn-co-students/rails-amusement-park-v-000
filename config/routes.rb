Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'welcome#home'

resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :foods
resources :catalog
#resources :desserts

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'

get 'logout', to: 'sessions#destroy', as: 'logout'
delete '/logout', to: 'sessions#destroy'

post 'users' => 'users#create'
get '/auth/:provider/callback', to: 'sessions#createauth'


end

