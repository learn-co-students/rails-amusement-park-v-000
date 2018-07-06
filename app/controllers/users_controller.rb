class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end


  def edit
  end

  def update
  end

  def create
    @user = User.new(user_params)

    if @user && @user.authenticate(params[:user][:password])
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_url
    end
  end

  def show
   @user = User.find(params[:id])

    if logged_in?
      render :show
    else
      redirect_to '/'
    end

  end

  private


    def user_params
      params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end

end
