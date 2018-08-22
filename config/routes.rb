Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  
  root "welcome#home"
end
