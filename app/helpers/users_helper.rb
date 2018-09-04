module UsersHelper
  def admin?
    user = User.find_by_id(session[:user_id])
    user.admin
  end
end
