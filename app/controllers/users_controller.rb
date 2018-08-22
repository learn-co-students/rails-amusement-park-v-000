class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    render html: "You made a user wow! Their name is: #{@user.name}"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end
end
