Rails.application.routes.draw do
  root 'welcome#home'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
    
  resources :users, only: [:new, :create, :show]
end
