Rails.application.routes.draw do
    resources :users
    get '/signin'  => 'sessions#new'
    post '/signin' => 'sessions#create'
    root 'users#new'
end
