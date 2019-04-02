class UsersController < ApplicationController

  def new

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        session[:user_id] = @user.id
        render :show 
      else
        #add a flash message here for errors
        redirect_to(controller: 'users', action: 'new')
      end
    end

    def home
      redirect_to(controller: 'users', action: 'home') unless current_user

    end

    def show
      @user = User.find(params[:id])
    end

    def index 

    end

  private

   def user_params
     params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
   end


end
