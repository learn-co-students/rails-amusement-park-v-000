Rails.application.routes.draw do
  resources :users

  get '/signin', to: 'sessions#sign_in', as: 'signin'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'users#destroy'

#  root 'welcome#home'

end
