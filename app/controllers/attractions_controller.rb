class AttractionsController < ApplicationController
    before_action :logged_admin?, only: %i[new create edit update]
    
    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find(current_user)
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
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

    def logged_admin?
        current_user && current_user.try(:admim)
    end
end
