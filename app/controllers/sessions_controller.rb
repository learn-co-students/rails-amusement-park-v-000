class SessionsController < ApplicationController
  def new
    render :signin
  end

  def create
    user = User.find_by(id: user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path user
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
