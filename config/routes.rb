Rails.application.routes.draw do
  resources :users
  resources :attractions, only: [:index, :show]

  get "/" => 'application#welcome'
  get "/signin" => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
