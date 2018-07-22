Rails.application.routes.draw do
    
    root to: "application#home"
    
    resources :users, only: [:new, :create, :show, :destroy]
    
    get '/signin', to: 'sessions#new'
    post '/sessions', to: 'sessions#create'
  
end
