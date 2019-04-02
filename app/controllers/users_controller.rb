class UsersController < ApplicationController

  def new

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to('/users/#{@user.id}')
      else
        redirect_to(controller: 'users', action: 'home')
      end
    end

    def home
      #redirect_to(controller: 'users', action: 'home') unless current_user

    end

    def show

    end

    def index 

    end

  private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end


end
