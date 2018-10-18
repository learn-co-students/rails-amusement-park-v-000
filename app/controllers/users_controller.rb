class UsersController < ApplicationController

	# before_action :authentification_required

   def new
   	@user = User.new
   # binding.pry
   end

   def create
    
    # params[:user][:admin] = ActiveRecord::Type::Boolean.new.cast(params[:user][:admin])
   	@user = User.create(user_params)
    # @user.admin =  ActiveRecord::Type::Boolean.new.cast(params[:user][:admin])
    
   	# if @user.save
   		session[:user_id] = @user.id
   		redirect_to user_path(@user) 
   	# else
   	# 	render :new
   	# end
   end

   def show
   	# authentification_required
   	# @user = current_user

    if !session.include?(:user_id)
      redirect_to '/'
    else
      @user = User.find(params[:id])

      render :show
    end
   end



  private
    def user_params
    	params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end


	


end