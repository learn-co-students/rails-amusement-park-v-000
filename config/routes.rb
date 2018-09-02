Rails.application.routes.draw do
  root "application#welcome"
  resources :users
  resources :attractions
  post "/rides/new" => "rides#new"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
