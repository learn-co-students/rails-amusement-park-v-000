class UsersController < ApplicationController
    
    before_action :check_user, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def show
        @message = params[:message] if params[:message]
        @message ||= false
        redirect_to root_url unless session.include? :user_id  
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user)
        end
    end
    
    private
    
    def check_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :happiness, :password, :admin)
    end
    
end
