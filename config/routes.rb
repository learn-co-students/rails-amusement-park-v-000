Rails.application.routes.draw do
    root 'users#index'
    resources :users
    
    
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    
    
    
    
end
