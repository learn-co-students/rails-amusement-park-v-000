module UsersHelper

  def admin?
    @user = User.find_by(id: session[:user_id])
    @user.admin
  end

end
