class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name= params[:user][:name]
    @user.nausea = params[:user][:nausea]
    @user.happiness = params[:user][:happiness]
    @user.tickets = params[:user][:tickets]
    @user.height = params[:user][:height]
    @user.password = params[:user][:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
end
