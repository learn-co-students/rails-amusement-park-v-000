Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :attractions
get '/signin', to: 'sessions#new'
post '/session', to: 'sessions#create', as: 'session'

root to: 'application#home'

end
