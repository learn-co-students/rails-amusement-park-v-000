class AttractionsController < ApplicationController
    before_action :authenticate, only: [:edit, :delete, :new]
    def index
        @attractions = Attraction.all
    end
    def new
        @attraction = Attraction.new
    end
    def create
        @attraction = Attraction.new(attractions_params)
        if @attraction.save
            redirect_to @attraction
        else
            redirect_to attractions_path
        end
    end
    def show
        @attraction = Attraction.find_by(id: params[:id])
    end
    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end
    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attractions_params)
            redirect_to @attraction
        else
            render 'attractions/edit'
        end
    end
    def delete
        attraction = Attraction.find_by(id: params[:id]).destroy
    end
    def ride
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @user = current_user
        @ride = Ride.find_by(id: params[:ride_id])
        @ride.take_ride
        render 'attractions/ride'
    end
    private
    def attractions_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end