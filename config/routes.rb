Rails.application.routes.draw do
  root to: 'application#welcome'

  resources :users, only: [:new, :create, :show]

end
