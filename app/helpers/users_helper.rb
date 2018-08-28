module UsersHelper

  def logged_in?
    current_user != nil
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end
end
