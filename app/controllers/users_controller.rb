class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # @user.admin = params[:user][:admin]
    @user.save
    # binding.pry
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

# #<User:0x00007feafa9dadb8
# id: nil,
# name: "Walt Disney",
# password_digest: "$2a$04$8Fm./57rXUyLyD.r/wVmJuDCXpviYAUYQqOnb/0ZRk5gvd2h7ZZJu",
# nausea: nil,
# happiness: nil,
# tickets: nil,
# height: nil,
# admin: true>
# [10] pry(#<UsersController>)> @user.save
# => false





  def show
    if current_user && logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end



  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
