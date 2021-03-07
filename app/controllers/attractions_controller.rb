class AttractionsController < ApplicationController

    before_action :set_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new(user_id: session[:user_id], attraction_id: @attraction.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to new_attraction_path
        end
    end

    def edit
    end

    def update
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            redirect_to edit_attraction_path(@attraction)
        end
    end

    private
    def attraction_params
        params.require(:attraction).permit(
            :name,
            :min_height,
            :happiness_rating,
            :nausea_rating,
            :tickets
        )
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end
end
