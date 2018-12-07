Rails.application.routes.draw do
  resources :users
  root 'users#welcome'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
end
