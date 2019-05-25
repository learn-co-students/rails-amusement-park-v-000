class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]




  def new
    @user = User.new
  end

  def create
    # binding.pry
    user = User.new(user_params)
    if user.save
     session[:user_id] = user.id
     # getting users/1 binding.pry
     redirect_to user_path(user)
   else
     render 'new'
   end
 end

 def show
   @user = User.find_by_id(params[:id])
   @message = params[:message]
 end



 def user_params
   params.require(:user).permit(
     :name,
     :height,
     :tickets,
     :happiness,
     :nausea,
     :admin,
     :password)
 end


end
