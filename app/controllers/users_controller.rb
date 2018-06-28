class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :nausea,
      :happiness,
      :tickets,
      :height,
      :admin
    )
  end
end
