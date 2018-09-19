Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  resources :rides


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
end
