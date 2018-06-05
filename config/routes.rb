Rails.application.routes.draw do

  resources :rides
  resources :attractions
  resources :users, only: [:new, :create, :show]
  get '/signin', to: 'users#index'

end

# rake routes | grep rides
# rake routes | grep attractions
# rake routes | grep users
