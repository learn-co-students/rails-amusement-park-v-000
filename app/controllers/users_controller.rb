class UsersController < ApplicationController


    def new 
    @user = User.new
    end
    
    def user_signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        # binding.pry
        if @user.save
            session[:user_id] = @user.id
            # binding.pry
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end
    

    private
    def user_params
       #  binding.pry
        params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end
