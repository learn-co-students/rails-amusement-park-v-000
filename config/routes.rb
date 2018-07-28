Rails.application.routes.draw do
  root 'application#welcome'
  resources :users
  match 'signin' => 'users#signin', via: [:get, :post]
end
