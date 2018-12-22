Rails.application.routes.draw do

    root 'welcome#home'

    get '/signup' => 'users#new'
    post '/signup' => 'users#create'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
  
end
