class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
    @message ||= false

  end


  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :tickets,
      :happiness,
      :nausea,
      :password,
      :admin
    )
  end

end
