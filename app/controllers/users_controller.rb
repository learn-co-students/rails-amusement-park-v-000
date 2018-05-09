class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]


  def new
  end

  def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      if session[:user_id]
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
  end


  def edit
  end

  def show
    @user = current_user
    if @user.nil?
      redirect_to '/'
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :height,
      :happiness,
      :admin,
      :nausea,
      :tickets)
  end


  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end