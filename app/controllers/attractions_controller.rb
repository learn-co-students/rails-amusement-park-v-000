class AttractionsController < ApplicationController


    def index
      @attractions = Attraction.all
    end

    def new
      @attraction = Attraction.new
      render :new
    end

    def create
      @attraction = Attraction.new(attraction_params)
      if current_user.admin == true
        @attraction.save
        redirect_to @attraction
      end
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end

    def edit
      @attraction = Attraction.find_by(id: params[:id])
    end

    def update
      @attraction = Attraction.find_by(id: params[:id])
      if current_user.admin == true
        @attraction.update(attraction_params)
      end
      redirect_to attraction_path(@attraction)
    end


    def destroy
      @attraction = Attraction.find_by(id: params[:id])
      @attraction.destroy
    end

    private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end




end
