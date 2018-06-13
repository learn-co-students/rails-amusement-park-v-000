class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
def show
  

    if !current_user.admin
      if current_user != @user
        redirect_to root_path
      end
    end
end
def edit
end
def create


  @user = User.new(user_params)
 if @user.save
   session[:user_id] = @user.id
   redirect_to user_path(@user)
 else
   render :new
 end
end

def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to frogs_url, notice: 'User was successfully destroyed.' }
  end
end


private

def user_params
  params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :password_confirmation, :admin)
end
def set_user
  @user = User.find(params[:id])
end

end
