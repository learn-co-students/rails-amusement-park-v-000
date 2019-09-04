Rails.application.routes.draw do
  #resources :rides
  #resources :attractions
  resources :users , only: [:new, :create, :destroy,:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
