Rails.application.routes.draw do
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login'=> 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#logout'
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
end
