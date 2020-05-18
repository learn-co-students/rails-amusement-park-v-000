Rails.application.routes.draw do
  resources :users

  resources :attractions do
    # nested resource for songs
    resources :rides, only: [:create]
  end

  root 'welcome#index'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'

  post 'logout' => 'sessions#destroy'


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
