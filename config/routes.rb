Rails.application.routes.draw do
  resources 'attractions', only: [:index, :show]
  # get 'attractions', to: 'attractions#index'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  # I should keep this consistent in my routes, controllers, views, etc - either Log In or Sign In, not BOTH!
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :show, :create]

  root 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
