Rails.application.routes.draw do
  resources :users

  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy'
  post 'signin' => 'sessions#create'
  post '/rides' => 'rides#new'
end
