Rails.application.routes.draw do

    root 'home_page#index'

    get '/signin' => 'users#signin'
  
    resources :users, :rides, :attractions
end
