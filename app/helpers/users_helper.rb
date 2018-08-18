module UsersHelper
  def user_admin
    user = User.find(session[:user_id])
    user.admin
  end

end
