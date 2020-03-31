Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # root 'welcome#home'
  resources :users, only: [:new, :create, :show]

  root 'users#index'
end
