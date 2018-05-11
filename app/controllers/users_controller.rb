class UsersController < ApplicationController
  before_action :require_logged_in, except: [:new, :create]

  def new
  end

  def show
  end

  def edit
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :new
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :tickets, :nausea, :happiness, :height, :admin, :password)
  end
end
