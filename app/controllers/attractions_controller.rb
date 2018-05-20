class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        flash[:success] = "Attraction Created!"
        redirect_to @attraction
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        flash[:success] = "Attraction Updated!"
        redirect_to @attraction
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def ride 
        @attraction = Attraction.find(params[:id])
        user = current_user
        ride = Ride.new(attraction_id: @attraction.id, user_id: user.id)
        ride.take_ride
        flash[:success] = "#{ride.message}"
        redirect_to user 
    end

    def destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end


end
