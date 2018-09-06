class ApplicationController < ActionController::Base

  layout 'application'
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_user_path


  protect_from_forgery with: :exception
  def welcome
    render "layouts/welcome"
  end

  private

  def logged_in?
    if !!session[:user_id]
      true
    else
      false
    end
  end

  def current_user
    if logged_in?
      @user = User.find(session[:user_id])
      "#{@user.name}'s Profile"
    else
      false
    end
  end

  def current_user_path
    @user = User.find(session[:user_id])
    user_path(@user)
  end



end
