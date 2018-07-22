Rails.application.routes.draw do
    
    root to: "application#home"
    
    resource :users, only: [:new, :create, :show, :destroy]
  
end
