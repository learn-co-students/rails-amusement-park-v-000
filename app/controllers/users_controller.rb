class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @attractions = Attraction.all
    @user = User.new
    @user.name = params[:user][:name]
    @user.height = params[:user][:height]
    @user.happiness = params[:user][:happiness]
    @user.nausea = params[:user][:nausea]
    @user.tickets = params[:user][:tickets]
    @user.password = params[:user][:password]
    @user.admin = true if params[:user][:admin].to_i == 1
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "users/new"
    end
  end
end
