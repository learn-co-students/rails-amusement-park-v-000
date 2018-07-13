module UsersHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

end
