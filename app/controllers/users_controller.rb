class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show 
        @user = User.find(params[:id])
        if session[:user_id] != @user.id 
            redirect_to :root
        else 
        end
    end

    def hello
    end

    def ride
        @attraction = Attraction.find(params[:attraction][:id])
        @user = User.find(session[:user_id])
        @ride = Ride.new 
        @ride.attraction = @attraction
        @ride.user = @user
        @ride.save 

        @ride.take_ride

        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
