class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] =  "There was an error."
      render '/users/new'
    end
  end

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      render 'show'
    else
      redirect_to root_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end
