Rails.application.routes.draw do
  root :to => 'users#new'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  # scope '/admin' do
  #   resources :users, only: [:new, :show, :create]
  # end
  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:new, :show, :create]
  resources :rides, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
