Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]

  get '/signin', to: 'application#signin'
  root 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
