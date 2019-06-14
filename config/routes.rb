Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'

  get '/signin', to: 'sessions#new'

  post '/session', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :welcome]

  resources :attractions

end
