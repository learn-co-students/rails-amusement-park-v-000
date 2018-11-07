Rails.application.routes.draw do
  root 'application#home'
  resources :users, only: [:index, :show, :new, :create]
end
