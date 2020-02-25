class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def new
    @user = User.new
  end
    
  def create
  
    @user = User.create(user_params.merge(admin: params[:user_admin]))

    #if pw and confirm don't match, then redirect to the UsersController#new (which sends to view/users/new) 
    return redirect_to controller: 'users', action: 'new' unless @user.save    
    
    #if @user.save, then log in, set the session for this user, and redirect to the WelcomeController
    session[:user_id] = @user.id
    #redirect to user/show (_path means show)
    redirect_to user_path(@user)
  end
  
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

                                                                                                                      
  private
  
  def user_params
    params.require(:user).permit(:admin, :name, :height, :happiness, :nausea, :tickets, 
      :password)
  end
end



