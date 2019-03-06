class SessionsController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = "Logged in as #{user.name}"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    flash[:danger] = "Logged out sucessfully"
    redirect_to root_url
  end

  private
    def session_params
      params.permit(:name, :password)
    end
end