class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to '/users/new' unless @user.save
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    render :layout => "admin" unless !@user.admin
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation, :admin)
  end

  def require_login
    return redirect_to '/' unless session.include? :user_id
  end
end
