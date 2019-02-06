Rails.application.routes.draw do
  #resources :users, :sessions
  root "welcome#home"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  resources :users
  resources :rides
  resources :attractions do
    resources :rides
  end

end
