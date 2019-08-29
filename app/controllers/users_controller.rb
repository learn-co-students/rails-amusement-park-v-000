class UsersController < ApplicationController


    def new 
    #    user_signup
    @user = User.new
    end
    
    def user_signup
        @user = User.new
        # binding.pry
        # @user.admin = false
    end

    # def create_standard_user
        
    # end

    def create
        @user = User.new(user_params)
        if @user.save
            # binding.pry
            session[:user_id] = @user.id
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
        params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end
