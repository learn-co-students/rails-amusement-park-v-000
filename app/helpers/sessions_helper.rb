module SessionsHelper
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    return redirect_to root_path unless logged_in?
  end
end
