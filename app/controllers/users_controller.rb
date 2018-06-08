class UsersController < ApplicationController
  # skip_before_action :login_required, [ :new]
  

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

#signup/create user in db/future logins can check against this
  def create
    user_signup
    if @user.save
      user_login
      flash[:success] = "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  

end 