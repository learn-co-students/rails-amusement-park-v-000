class UsersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:new, :home]

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
      if session[:user_id] != nil
        @user = User.find(params[:id])
        @message = params[:message]
      else
        redirect_to root_path
      end
    end

  private

   def user_params
     params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
   end

  #  def require_login
  #    redirect_to root_path unless session[:user_id] != nil
  #    #add flash message and redirect to show page
  #  end


end
