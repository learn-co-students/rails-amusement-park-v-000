class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
     @message = params[:message] if params[:message]
     @message ||= false
     if !logged_in?
       redirect_to root_path
     end
   end

  def update
    @user.update(user_params)
  end


private

  def user_params
    params.require(:user).permit(:name, :nausea, :height, :happiness, :tickets, :password, :admin)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
