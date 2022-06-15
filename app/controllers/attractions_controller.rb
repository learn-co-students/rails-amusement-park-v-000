class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def new
        if user_admin
            @attraction = Attraction.new
        else
            redirect_to '/attractions'
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        if user_admin
            @attraction = Attraction.find(params[:id])
        else
            redirect_to '/attractions'
        end
    end

    def update
        if user_admin
            @attraction = Attraction.find(params[:id])
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            redirect_to '/attractions'
        end
    end

    private
     
    def attraction_params
        params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
    end
end
