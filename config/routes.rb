Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get "/" => 'application#welcome'
  get "/signin" => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
