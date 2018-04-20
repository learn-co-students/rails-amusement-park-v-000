Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
