class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def is_admin?
    if current_user != nil
      current_user.admin
    else
      return redirect_to(controller: 'sessions', action: 'new')
    end
  end

  def require_admin
    return redirect_to(controller: 'sessions', action: 'new') unless is_admin?
  end

  #logged_in/require_logged_in malfunctioning
  def logged_in?
    return redirect_to(controller: 'sessions', action: 'new') unless current_user
  end

  def require_logged_in
   return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

end
