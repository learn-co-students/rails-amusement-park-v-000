class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if(@user = User.new(user_params))
      if @user.save
        session[:user_id] = @user.id
        flash[:message] = "Welcome, #{@user.name}"
        redirect_to user_path @user
      else
        render :new
      end
    else
      flash[:message] = "There was an error creating the user"
      redirect_to signup_path
    end
  end

  def show
    if (@user = User.find_by(id: params[:id]))
      authorize(@user)
    else
      not_authorized
    end
  end

  private

  def user_params
    params.require(:user).permit([:name, :password, :tickets, :nausea, :happiness, :height, :admin])
  end

end
