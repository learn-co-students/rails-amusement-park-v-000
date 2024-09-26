class AttractionsController < ApplicationController
    before_action :verified_user 
    
    def index
        @attraction = Attraction.all 
    end
    
    def show
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new 
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(
            :name, 
            :min_height,
            :happines_rating,
            :nausea_rating,
            :tickets
        )
    end

end
