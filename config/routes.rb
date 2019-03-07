Rails.application.routes.draw do
  resources :users, :rides, :attractions

  root 'welcome#home'

end
