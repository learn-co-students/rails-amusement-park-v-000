Rails.application.routes.draw do
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  # get 'sessions/destroy'

  resources :users, only: [:new, :show, :create]

  root 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
