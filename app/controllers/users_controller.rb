class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show] 

    def new 
        @user = User.new 
    end 

    def show
        @user = User.find_by(id: params[:id]) 
        if !current_user.admin 
            if current_user != @user 
                redirect_to root_path   
            end
        end
    end 

    def create
        @user = User.new(strong_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render 'new' 
        end
    end 

    private 

    def strong_params 
        params.require(:user).permit(:name, :tickets, :height, :nausea, :happiness, :password)
    end

end