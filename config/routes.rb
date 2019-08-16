Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
    resources :users
    resources :attractions
    resources :rides, only: [:create]
    
    get '/signin' => 'sessions#sign_in'
    post '/signin' => 'sessions#create'
    get '/signout' => 'sessions#destroy'
end
