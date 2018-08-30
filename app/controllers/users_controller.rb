class UsersController < ApplicationController


  def home
  end

  def new
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
    # binding.pry
    redirect_to root_path unless session[:user_id]
    @user = User.find(params[:id])
  end

  def login
  end

  def signin
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


private
  def user_params
    params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
  end
end
