class UsersController < ApplicationController

    def home 
    end
    
    def new 
        @user = User.new
    end 

    def create 
        # binding.pry
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new 
        end
    end 

    def show
        # binding.pry 
        @user = User.find(session[:user_id])
    end 

    private
    
    def set_user
      @user = User.find(params[:id])
    end

    
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end
    
end
