Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  resources :users
  resources :sessions
  resources :attractions

  get '/signin' => 'sessions#new', as: :signin
  post '/create' => 'sessions#create'
  get '/attractions/:id/ride' => 'rides#ride'
end
