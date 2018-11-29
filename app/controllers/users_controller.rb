class UsersController < ApplicationController
  #before_action :require_logged_in, only: :show
  #before_action is causing redirect_to user_path after signup to reroute to login
  #i think because session create redirects to login path
  #or maybe was creating first which was hitting errors

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if !@user.save #working in pry when don't include password
      redirect_to root_path
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    @admin = is_admin?
      #don't have access to controller methods in view
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
