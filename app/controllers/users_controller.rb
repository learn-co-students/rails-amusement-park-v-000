class UsersController < ApplicationController

    def index
    end

    def show
        if current_user
            @user = User.find_by(id: params[:id])
            redirect_to '/' if current_user.id != @user.id 
        else
            redirect_to '/'
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to @user
        else 
            render 'new'
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
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end