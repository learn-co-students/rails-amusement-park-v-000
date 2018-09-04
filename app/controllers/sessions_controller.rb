class SessionsController < ActionController::Base

  def create
    @user = User.find_by_id(params[:user][:name])
    # raise params.inspect
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    # raise params.inspect
    session.clear
    redirect_to '/'
  end

  def session_params
    params.require(:user).permit(:name, :password)
  end
end
