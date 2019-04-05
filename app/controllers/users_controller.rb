class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new, :create, :home]

  def new

  end

  def create

    user = User.new(user_params)

    if user.valid? && params[:user][:password] == params[:user][:password_confirmation]
        @user = User.create(user_params)
        session[:user_id] = @user.id
        render :show
      else
        flash[:notice] = "Please complete the form with valid entries."
        redirect_to(controller: 'users', action: 'new')
      end
    end

    def home

    end

    def show

        @user = User.find(params[:id])
        @message = params[:message]
      
    end

  private

   def user_params
     params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
   end


end
