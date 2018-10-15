module LoginHelper
  def user_signup(user_params)
    @user = User.create(user_params)
    session[:user_id] = @user.id
  end

  def user_login
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
    end
  end

  def admin_signup
    
  end
end
