class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :index]

    def index
    end

    def show
        @user = User.find_by(id: params[:id])
        @message = params[:message]
    end

    def new
        @user = User.new
    end

    def create 
        #byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            #byebug
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end

end
