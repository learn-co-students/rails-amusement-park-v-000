Rails.application.routes.draw do
  resources :users
  resources :attractions

  root "static_pages#home"
end
