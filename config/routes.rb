Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  resources :users, except: [:new]

end
