class UsersController < ApplicationController
  before_action :require_logged_in, except: [:new, :create] #prevents user from viewing user show page and redirects to home page if not logged in

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
      redirect_to '/users/new'
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
