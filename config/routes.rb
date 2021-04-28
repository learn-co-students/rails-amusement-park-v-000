Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :rides, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :attractions, only: [:index, :show, :new, :edit, :create, :update, :destroy]
end
