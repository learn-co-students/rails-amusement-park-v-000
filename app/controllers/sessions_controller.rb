class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(params[:id])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to root_path unless @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end



  def destroy
    session.clear
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :admin, :happiness, :nausea, :height, :tickets)
  end


end
