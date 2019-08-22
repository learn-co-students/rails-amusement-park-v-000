Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#index'
  post '/signin' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/signin' => "sessions#new"
  post '/rides' => "rides#create"
  resources :users
  resources :attractions
end
