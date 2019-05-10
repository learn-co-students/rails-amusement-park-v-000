class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id]) 
        #binding.pry
    end


    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def require_login
        if !session.include? :user_id
            redirect_to '/'
        end
    end

end