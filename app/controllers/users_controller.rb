class UsersController < ApplicationController
  #before_action :require_signin
  #skip_before_action :require_signin, only: [:show]

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params(:name, :nausea, :happiness, :tickets, :height, :password))
    if @user.valid?
      @user.save
      current_user(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    require_signin
    @user = User.find(params[:id])
  end

  def signin
    @users = User.all
  end

  def create_signin
    user_id = user_params(:name)[:name].to_i
    if user_id == nil || user_params(:name).empty?
      redirect_to '/signin'
    else
      @user = User.find(user_id)
      current_user(@user)
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  def require_signin
    redirect_to root_path unless session.include? :user_id
  end
end
