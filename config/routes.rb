Rails.application.routes.draw do
    resources :users, :attractions

    resources :attractions do 
        member do 
            post 'ride'
        end
    end

    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    get '/logout' => 'sessions#destroy'

    root to: 'sessions#welcome'



end
