Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  post '/login' => 'sessions#create', as: :login
  get '/logout' => 'sessions#destroy'
  post '/attractions/:id' => 'attractions#update'


  resources :users , only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :rides, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :destroy]
end
