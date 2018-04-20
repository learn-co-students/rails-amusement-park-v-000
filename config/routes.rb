Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  root 'welcome#index'
  resources :users, only: [:new, :create, :show]
end
