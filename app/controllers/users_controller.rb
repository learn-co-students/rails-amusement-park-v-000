class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user
      redirect_to user_path
    else 
      render :new
    end
  end

  # "user"=>{"name"=>"Amy Poehler", "height"=>"58", "happiness"=>"3", "nausea"=>"2", "tickets"=>"15", "password"=>"password"}

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password_digest)
    end

end
