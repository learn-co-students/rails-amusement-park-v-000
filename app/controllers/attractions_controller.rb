class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all 
        @user = User.find(session[:user_id])
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
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
        binding.pry
        @attraction.update(name: params[:attraction][:name], min_height: params[:attraction][:min_height], happiness_rating: params[:attraction][:happiness_rating], nausea_rating: params[:attraction][:nausea_rating], tickets: params[:attraction][:tickets])
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
