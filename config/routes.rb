Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get "/signup" => "users#new"
  post "/signup" => "users#show"
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get "/logout" => "sessions#destroy"
  post "/rides" => "rides#create"

end
