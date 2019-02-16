class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
         session[:user_id] = @user.id
         redirect_to user_path(@user)
        else
          redirect_to root_path
        end
    end

    def show 
      @user = User.find(params[:id])
      if session[:attraction_id]
        @ride = Ride.create(:user_id => @user.id, :attraction_id => session[:attraction_id])
      end
    end

    def edit
    end

    def update
    end

    private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end   

    def require_login
      redirect_to root_path unless session.include? :user_id
    end
end
