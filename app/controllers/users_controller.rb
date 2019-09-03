class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    @user.password = params[:user][:password]
    @user.admin = admin_value(params[:user][:admin])
      if @user.save && @user.authenticate(@user.password)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
  end

  def show
    authentication_required
    @user = User.find_by(id: params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height, :admin)
  end

  def admin_value(str)
    v = str.to_i
    v == 1 || v == 0 ? v : 0
  end

end
