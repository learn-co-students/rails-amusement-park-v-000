class UsersController < ApplicationController
  before_action :is_logged_in, only: [:show]
  # before_action before_action :set_item, only: [:edit, ..., :my_member_action] :set_item, only: [:edit, ..., :my_member_action]
 
 def home
   
 end
  def new
    @user = User.new
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

  def show
    @user = User.find_by(id: params[:id])
    # binding.pry
  end

    # def destroy
    # # forget(current_user)
    # # session.delete(:user_id)
    # # @current_user = nil
    # # redirect_to root_url
    # end

private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
