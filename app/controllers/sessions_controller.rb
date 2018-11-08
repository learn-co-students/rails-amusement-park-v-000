class SessionsController < ApplicationController
  skip_before_action :validate_session, only: [:new, :create, :destroy]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(session_params[:id])
    if @user.authenticate(session_params[:password])
      log_in(@user.id)
      redirect_to user_path(@user)
    else
      redirect_to :log_in_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:id, :password)
  end
end
