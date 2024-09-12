Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#hello"

  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:index, :show, :edit, :new, :create, :update]


  get '/signin' => "sessions#new", as: 'signin'
  post '/session' => "sessions#create"

  get '/logout' => "sessions#destroy"

  post '/rides' => "rides#create"



end
