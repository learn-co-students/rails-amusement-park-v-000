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

    if params[:user][:admin].to_i == 1
      @user.admin = true
    else
      @user.admin = false
    end
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/users/new'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end
end
