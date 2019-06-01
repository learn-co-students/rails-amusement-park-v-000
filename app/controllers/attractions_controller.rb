class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all        
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
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
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            flash[:message] = "Attraction was updated"
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
