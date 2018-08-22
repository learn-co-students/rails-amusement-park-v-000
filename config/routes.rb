Rails.application.routes.draw do
  root 'application#home'
  resources :users, only: [:new, :create, :show, :destroy]
  resources :attractions

  get '/signin', to: 'sessions#sign_in', as: :signin
  post '/signin', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/attractions', to: 'attractions#index'
end
