Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  
  resources :users, only: [:new, :create, :show]
  resources :attractions

  get '/signin' => 'session#new'
  post '/signin' => 'session#create'
  get '/logout' => 'session#destroy'
  post '/rides' => 'rides#create'
end
