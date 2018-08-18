class UsersController < ApplicationController
  before_action :require_log_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(session[:user_id])
    if params[:message]
      @message = params[:message]
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
