class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # def current_user
  #
  #   session[:user_id] = @user.id
  # end

end # class ApplicationController
