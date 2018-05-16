class UsersController < ApplicationController

  def new

  end

  def create #user signup
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    #need some kind of logic that translates the happiness_rating into a mood
    @mood = @user.mood

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end



end
