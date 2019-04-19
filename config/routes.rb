Rails.application.routes.draw do

  #get '/' => 'application#index'

  resources :users #, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :rides#, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :attractions#, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
