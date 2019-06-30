class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])

    if session[:user_id] == @user.id

      if @user.happiness

        if @user.happiness >= 3
          @happiness = "happy"
        end
      end
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "user deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end

private

  def user_params
    params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height, :admin)
  end