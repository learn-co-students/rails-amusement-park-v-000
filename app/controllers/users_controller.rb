class UsersController < ApplicationController
  def new
    # render :plain => "This is the #new action controller in the users controller"
    @user = User.new
  end

  def create
    # render :plain => "This is the #create action controller in the users controller"
    @user = User.new(user_params)
    # raise params.inspect
      if @user.save

      # This will get implemented later when we build sessions
      # session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :plain => "The form wasn't completed correctly"
    end
  end

  def show
    # # This will be implemented with the sessions later on:
    # if logged_in?
    #   @user = User.find_by(id: params[:id])
    # else
    #   redirect_to root_path
    # end
    @user = User.find_by(id: params[:id])
  end

  private #=> These will be the strong params

  def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
