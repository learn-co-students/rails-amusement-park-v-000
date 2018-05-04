class ApplicationController < ActionController::Base

  def current_user
    session[:name]
  end

  helper_method :current_user

  def welcome
    if current_user
      @user=current_user
    end
  end

end
