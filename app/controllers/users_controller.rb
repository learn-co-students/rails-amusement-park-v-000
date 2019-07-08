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

        if @ride.too_short && @ride.too_broke 
            @message = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}. You are not tall enough to ride the #{@ride.attraction.name}."
        elsif @ride.too_broke && !@ride.too_short
            @message = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}."
        elsif @ride.too_short && !@ride.too_broke
            @message = "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
        else
            @message = "Thanks for riding the #{@ride.attraction.name}!"
        end

        render 'show'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def @ride.too_short 
        @ride.attraction.min_height > @ride.user.height 
    end

    def @ride.too_broke 
        @ride.attraction.tickets > @ride.user.tickets 
    end
end
