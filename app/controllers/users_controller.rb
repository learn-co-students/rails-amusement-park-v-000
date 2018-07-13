class UsersController < ApplicationController

  before_action :current_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user][:name], height: params[:user][:height], happiness: params[:user][:happiness], nausea: params[:user][:nausea], tickets: params[:user][:tickets], admin: params[:user][:admin], password: params[:user][:password])
    if @user
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      redirect_to user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
