class UsersController < ApplicationController
  # skip_before_action :login_required, [ :new]


  def new
    @user = User.new
  end
  
  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end 
  end

#signup/create user in db/future logins can check against this
  def create
    @user = User.new(user_params)
    if @user.save
      # user_login
      session[:user_id] = @user.id
      flash[:success] = "welcome"
      redirect_to user_path(@user)
    else
      render :new
    end
  end


private
  def user_params
   params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin) 
  end 

end 