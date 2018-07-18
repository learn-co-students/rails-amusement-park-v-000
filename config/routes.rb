Rails.application.routes.draw do
  root 'welcome#home'
  resources :attractions
  resources :users
  resources :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/attractions/:id/edit' => 'attractions#edit'
  post '/attractions/:id' => 'attractions#update'

end
