Rails.application.routes.draw do
  root 'application#hello'

  resources :rides, only: [:create]
  # get '/rides/result' => 'rides#result' <<-- spec wants to redirect to user page...
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:new, :create, :show]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end

# rake routes | grep rides
# rake routes | grep attractions
# rake routes | grep users
