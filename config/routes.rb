Rails.application.routes.draw do
  
    root 'welcome#home'
  
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/signout' => 'sessions#destroy'
    post '/rides/create' => 'rides#create'
    resources :users
    resources :attractions
end
