Rails.application.routes.draw do
  resources :users
  root 'application#home'
  #sessions routes
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
