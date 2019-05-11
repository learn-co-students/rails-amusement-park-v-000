class SessionsController < ApplicationController
  
  def home
  end

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.find_by(id: params[:user][:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
    end

end
