class UsersController < ApplicationController

  def show
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      @attributes = attributes_list.delete_if {|att, v| att == "password" || att == "name"}
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
    @attributes = attributes_list
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

  def attributes_list
    {"name"=>nil, "password"=>nil, "happiness"=>nil, "nausea"=>nil, "height"=>nil, "tickets"=>nil, "admin"=>false}
  end
end
