Rails.application.routes.draw do

    root 'home_page#index'

    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
  
    resources :users, :rides, :attractions
end
