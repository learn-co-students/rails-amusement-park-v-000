class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        @user = User.find(params[:id])
        @message = params[:message]
    end


    def new
        @user = User.new
    end
   
    def create
    @user = User.new(user_params)
    
     if @user.save 
        session[:user_id] = @user.id
        #  binding.pry
        redirect_to user_path(@user)
      else
        render :new 
     end
    end
    
    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit 
      end
    end
 
    
    private
    def set_user
      @user = User.find(params[:id])
    end
    
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)

  end
end
        
