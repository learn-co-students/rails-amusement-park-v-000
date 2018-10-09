class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update, :destroy]
  before_action :require_log_in

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
        flash[:message] = "Succesfully created attraction!"
        redirect_to attraction_path(@attraction)
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @attraction.update(attraction_params)
        flash[:message] = "Succesfully updated attraction!"
        redirect_to attraction_path(@attraction)
      else
        render 'edit'
      end
    end

    def destroy
      @attraction.destroy
      flash[:message] = "Succesfully destroyed attraction!"
      redirect_to attractions_path
    end

    private

    def find_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end


end
