Rails.application.routes.draw do
  resources :users
  root :to => 'users#new'
  get '/signin', to: 'sessions#new'
end
