class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def update
        user = User.find(session[:user_id])
        @ride = Ride.create(user_id: user.id, attraction_id: params[:id])
        @ride.take_ride
        if @ride.user.height < @ride.attraction.min_height && @ride.user.tickets < @ride.attraction.tickets
            flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name} You do not have enough tickets to ride the #{@ride.attraction.name}"
        elsif @ride.user.height < @ride.attraction.min_height
            flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name}"
        elsif @ride.user.tickets < @ride.attraction.tickets
            flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name}"
        else
            flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
        end
        redirect_to user_path(@ride.user)
    end

end