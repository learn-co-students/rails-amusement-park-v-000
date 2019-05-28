class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    if params[:user][:name] != nil && params[:user][:height] != "" && params[:user][:happiness] != ""&& params[:user][:nausea] != "" && params[:user][:tickets] != ""
      @user = User.create(name: params[:user][:name], password: params[:user][:password], happiness: params[:user][:happiness], nausea: params[:user][:nausea], height: params[:user][:height], tickets: params[:user][:tickets])
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
     @user = User.find(params[:id])
  end

  def home
  end
end
