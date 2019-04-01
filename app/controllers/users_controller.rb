class UsersController < ApplicationController

  def new

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to(controller: 'users', action: 'show')
      else
        redirect_to(controller: 'users', action: 'new')
      end
    end

    def home
      redirect_to(controller: 'users', action: 'new') unless current_user

    end

    def show

    end

  private

   def user_params
     params.require(:user).permit(:name, :password, :password_confirmation)
   end


end
