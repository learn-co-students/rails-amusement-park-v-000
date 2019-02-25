Rails.application.routes.draw do
  
  root 'application#home'
  
  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    post '/logout' => :destroy
  end

  resources :rides, only: :new

  resources :attractions
  resources :users
  
end
