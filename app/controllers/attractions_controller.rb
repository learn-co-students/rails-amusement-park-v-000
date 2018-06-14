class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]

    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def edit
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.valid?
            @attraction.save
            redirect_to attraction_path(@attraction)
            flash[notice]= "Attraction was successfully added."
        else 
            render :new
        end
    end

    def update
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
            flash[notice]= "Attraction was successfully updated."
        else
            render :edit
        end
    end
    
    def destroy
        @attraction.destroy
        redirect_to attractions_path
        flash[:notice] = "Attraction was deleted"
    end

    private 
        def set_attraction
            @attraction = Attraction.find(params[:id])
        end

        def attraction_params
            params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
        end
end
