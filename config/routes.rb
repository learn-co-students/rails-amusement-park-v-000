Rails.application.routes.draw do
  
  root 'application#home'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  post 'users/:id' => 'users#update', as: 'update_user'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  get 'attractions/' => 'attractions#index'
  get 'attractions/new' => 'attractions#new'
  get 'attractions/:id' => 'attractions#show', as: 'attraction'
  post 'attractions/:id' => 'attractions#create'
  get 'attractions/:id/edit' => 'attractions#edit', as: 'attraction_edit'
  patch 'attractions/:id' => 'attractions#update'

end
