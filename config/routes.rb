Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get    '/signin',  to: 'session#new',    as: 'signin'
  post   '/session', to: 'session#create', as: 'session'
  delete '/session', to: 'session#destroy'
  
  get  '/users',          to: 'users#index', as: 'users'
  get  '/users/new',      to: 'users#new',   as: 'new_user'
  post '/users',          to: 'users#create'
  get  '/users/:id',      to: 'users#show',  as: 'user'
  get  '/users/:id/edit', to: 'users#edit',  as: 'edit_user'
  
  get   '/attractions',          to: 'attractions#index', as: 'attractions'
  get   '/attractions/new',      to: 'attractions#new',   as: 'new_attraction'
  post  '/attractions',          to: 'attractions#create'
  get   '/attractions/:id',      to: 'attractions#show',  as: 'attraction'
  get   '/attractions/:id/edit', to: 'attractions#edit',  as: 'edit_attraction'
  patch '/attractions/:id',      to: 'attractions#update'
  
  post '/rides', to:"rides#create", as: 'rides'
  
end
