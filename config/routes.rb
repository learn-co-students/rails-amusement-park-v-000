Rails.application.routes.draw do
    resources :users
    get '/signin'  => 'sessions#new'
    root 'users#new'
end
