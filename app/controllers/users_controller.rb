class UsersController < ActionController::Base
  before_action  :require_login
  skip_before_action :require_login, only: [:new, :create, :welcome]

  def new
    @user=User.new
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

  def show
    @user = User.find_by_id(params[:id])
  end

  def welcome
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
