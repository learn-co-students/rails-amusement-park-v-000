Rails.application.routes.draw do

  root 'welcome#index'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users , only: [:new, :show, :create]

end
