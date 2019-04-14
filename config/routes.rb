Rails.application.routes.draw do
  get 'users_controller/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :show]

  root 'application#home'
end
