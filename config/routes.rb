Rails.application.routes.draw do
  namespace :admin do
    resources :admins
  end

  root 'application#welcome'
  resources :attractions
  post 'ride', to: 'attractions#ride'
  resources :users
  match 'signin' => 'users#signin', via: [:get, :post]
  get 'logout', to: 'users#logout'
end
