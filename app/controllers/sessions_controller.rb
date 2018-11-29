class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if !@user.authenticate(params[:user][:password])
      redirect_to login_path
    else
      session[:user_id] = @user.id #have access to id after do find_by, even though only name and pw are in params
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
