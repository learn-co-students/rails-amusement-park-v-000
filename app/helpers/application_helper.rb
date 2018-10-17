module ApplicationHelper

  def logged_in?
    !!current_user
  end

  def current_user
    @_current_user ||= User.find_by(:id => session[:user_id])
  end

  def user_is_admin?
    current_user.admin
  end
end
