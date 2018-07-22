Rails.application.routes.draw do
    
    root to: "welcome#home"
    
    resources :users, only: [:new, :create, :show, :destroy]
    resources :attractions, only: [:new, :create, :index]
    
    get '/signin', to: 'sessions#new'
    post '/sessions', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
  
end
