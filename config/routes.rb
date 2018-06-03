Rails.application.routes.draw do

  resources :users
  resources :attractions

  root 'welcome#home'

end
