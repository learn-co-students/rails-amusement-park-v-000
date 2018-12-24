Rails.application.routes.draw do
  root 'application#home'
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  resources :users, except: [:new]

end
