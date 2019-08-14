Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  get '/', to: 'application#home'
  get '/signing', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
