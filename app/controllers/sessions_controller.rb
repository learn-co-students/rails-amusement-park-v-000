class SessionsController < ApplicationController

  def new
    if !!logged_in?
      redirect_to user_path(current_user)
    else
    @user = User.new
  end
end

  def create

    @user = User.find_by(:name => user_params[:name])

    if @user.try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signin_path
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :password
      )
    end

end
