Rails.application.routes.draw do
  root 'application#home'
  get '/signup' => 'users#new'
  resources :users
end
