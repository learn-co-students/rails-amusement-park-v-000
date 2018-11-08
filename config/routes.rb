Rails.application.routes.draw do
  root 'application#home'

  get '/users/new' => 'users#new', as: :sign_up
  resources :users, only: [:create, :index, :show]

  get '/signin' => 'sessions#new', as: :log_in
  resource :session, only: [:create, :destroy]
end
