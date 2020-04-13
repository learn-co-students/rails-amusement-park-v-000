Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'welcome#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  post '/attraction/:id/take_ride' => 'attractions#take_ride'  

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

end
