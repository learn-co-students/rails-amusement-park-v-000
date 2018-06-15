Rails.application.routes.draw do
  root 'welcome#home'

  resources :users
  resources :attractions, only: [:show, :index, :new, :create, :edit, :update]

  get '/users/new' => 'users#new', as: 'signup'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/attractions/new' => 'attractions#new'
  post '/attractions' => 'attractions#create'
  get '/attractions/:id/edit' => 'attractions#edit'
  patch '/attractions/:id' => 'attractions#update'

  post '/rides/new' => 'rides#create'

end
