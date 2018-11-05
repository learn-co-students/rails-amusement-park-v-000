class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.create(user_params(params[:user].keys))
    #@user = User.create(user_params)

    # @user = User.create(user_params(params[:user].each_pair { |param| param }))
    if @user
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'show', id: @user.id
      # redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    # raise params.inspect
    @user = User.find(params[:id])
    @user.update(user_params(params[:user].keys))
    redirect_to user_path(@user)
  end

  private
  #
  # def user_params
  #   params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  # end
  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
