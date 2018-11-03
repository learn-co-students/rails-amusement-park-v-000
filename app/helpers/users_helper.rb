module UsersHelper
  def current_user
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
  end
end
