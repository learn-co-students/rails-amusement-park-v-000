class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def show
        if session.include? :user_id
            @message = params[:message] if params[:message]
            @message ||= false
            render :show
        else
            redirect_to '/'
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end
end