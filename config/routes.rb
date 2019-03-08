Rails.application.routes.draw do
  resources :users

  get '/signin', to: 'sessions#sign_in', as: 'signin'

  root 'welcome#home'

end
