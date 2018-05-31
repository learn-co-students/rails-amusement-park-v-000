Rails.application.routes.draw do
  root 'welcome#home'
  
  
  resources :attractions do
    resources :rides
  end 
end