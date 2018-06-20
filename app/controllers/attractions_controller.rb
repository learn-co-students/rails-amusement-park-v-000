class AttractionsController < ApplicationController
    before_action :find_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def show
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            flash[:notice] = "Attraction successfully created."
            redirect_to @attraction
        else
            render :new
        end
    end

    def edit
    end

    def update
        @attraction.assign_attributes(attraction_params)
        if @attraction.save
            flash[:notice] = "Attraction successfully updated."
            redirect_to @attraction
        else
            render :edit
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def find_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end
end
