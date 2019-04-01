class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    #binding.pry
    if user = User.create(user_params)
      session[:user_id]= user.id
      redirect_to user_path(user)
    else
      render 'new'
    end 
  end

  def show
   # binding.pry
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :name, 
        :height, 
        :nausea, 
        :happiness, 
        :tickets, 
        :password, 
        :admin
    )
end 
end
