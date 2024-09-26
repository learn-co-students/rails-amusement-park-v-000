
Rails.application.routes.draw do
  resources :attractions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#hello'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  post '/users/ride' => 'users#ride'
end
