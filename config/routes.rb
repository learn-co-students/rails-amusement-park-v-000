Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
end
