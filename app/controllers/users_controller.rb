class UsersController < ApplicationController
    
    def new
        @user=User.new
    end
    
    def create
        #skipping validations for this lab...
        #skipping strong params too, maybe?
        @user=User.create(user_params)
        session[:user_id]=@user.id
        #redirect when we're ready
        redirect_to users_show_path(@user)
    end
    
    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end