Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'users#show'
end
