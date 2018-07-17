Rails.application.routes.draw do
  root 'welcome#home'
  resources :attractions
  resources :users
  resources :rides

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/attractions/:id/edit' => 'attractions#edit'
  post '/attractions/:id' => 'attractions#update'

end
