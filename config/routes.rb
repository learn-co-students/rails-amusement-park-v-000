Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  resources :users, only: [:new, :show, :create]

  match 'users', to: 'users#show', via: [:get, :post]

  get '/signin' => 'sessions#sign_in'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :attractions, only: [:index, :show]
end
