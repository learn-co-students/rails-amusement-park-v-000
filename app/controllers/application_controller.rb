class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helpers do
  #   def current_user
  #     session[:user_id] || nil
  #   end
  # end
end
