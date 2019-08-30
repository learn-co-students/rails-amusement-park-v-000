Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get       '/',                to: 'application#index', as: 'root'
  get       'signin',           to: 'sessions#new'
  post      '/signin',          to: 'sessions#create'
  delete    '/signout',         to: 'sessions#destroy'
  post      'attractions/:id',  to: 'attractions#show'
  resources :users,             only: [:new, :create, :show]
  resources :attractions,       only: [:index, :new, :create, :show, :edit, :update]
end
