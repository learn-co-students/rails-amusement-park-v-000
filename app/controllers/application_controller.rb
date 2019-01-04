class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def in_session?
    !!session[:user_id]
  end

  def home
    if in_session?
      @user = User.find(session[:user_id])
      redirect_to "/users/#{@user.id}"
    end
  end

  def current_user
    @user = User.find(session[:user_id])
  end
end
