Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show]

  get '/signin' => 'sessions#new'
  get '/sessions/create'
end
