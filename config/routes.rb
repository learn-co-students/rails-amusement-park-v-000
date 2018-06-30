Rails.application.routes.draw do
  root 'welcome#home'
  resources :rides
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
 post '/signin' => 'sessions#create'
 post '/signout' => 'sessions#destroy'

end
