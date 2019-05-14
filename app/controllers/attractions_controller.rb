class AttractionsController < ApplicationController
    before_action :require_login
    
    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        #binding.pry
        @attraction = Attraction.find_by(id: params[:id])
        
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
        @attraction.update(attraction_params)

        redirect_to attraction_path(@attraction)
    end

    private

    def require_login
        if !session.include? :user_id
            redirect_to '/'
        end
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end