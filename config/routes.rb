Rails.application.routes.draw do

    root 'home_page#index'

    resources :users
    
    resources :attractions do 
        resources :rides 
    end

    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'

    get 'users/:id', to: 'users#show'
  
end
