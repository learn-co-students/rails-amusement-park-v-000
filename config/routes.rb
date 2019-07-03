Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  resources :users, only: [:new, :show, :create]

  match 'users', to: 'users#show', via: [:get, :post]

  get '/signin' => 'sessions#sign_in'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]

  match 'attractions', to: 'attractions#show', via: [:get, :post]

  resources :rides, only: [:new, :show, :create]

end
