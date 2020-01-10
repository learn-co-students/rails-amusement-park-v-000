
class UsersController < ApplicationController 
    def new 
    end

    def create
        @user = User.create(user_params)
        if @user 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.id != session[:user_id] 
          redirect_to root_path
        end
    end

    def edit
    end

    def update 
    end

    def destroy
    end

    private

    def user_params
        #remember to put everything in permit
        params.require(:user).permit(:name,:mood,:height,:happiness,:nausea,:dollars,:tickets,:admin, :password)
    end
end