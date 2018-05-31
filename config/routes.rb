Rails.application.routes.draw do
  root 'welcome#home'
  
  devise_for :users
  
  resources :attractions do
    resources :rides
  end 
end