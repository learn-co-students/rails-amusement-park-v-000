module SessionsHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorized?(id)
    current_user.id == id
  end
end
