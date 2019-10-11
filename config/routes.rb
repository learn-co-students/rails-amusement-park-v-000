Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attractions
  resources :rides, only: [:create]
end
