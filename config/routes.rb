Rails.application.routes.draw do

  get 'welcome/home'
  get 'users/new'

  root 'welcome#home'

  resources :users, only: [:show, :new, :create]

end
