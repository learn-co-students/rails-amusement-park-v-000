class AttractionsController < ApplicationController

    def index
      @attractions = Attraction.all
      find_user
    end

    def show
      find_attraction
      find_user
    end

    def new
      @attraction = Attraction.new
    end

    def create
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to new_attraction_path
      end
    end

    def edit
      find_attraction
    end

    def update
      find_attraction
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    end

    private

    def find_user
      @user = User.find_by_id(session[:user_id])
    end

    def find_attraction
      @attraction = Attraction.find_by_id(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
end
