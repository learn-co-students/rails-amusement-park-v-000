module UsersHelper

  def user_admin?
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @user.admin
    end
  end 

end
