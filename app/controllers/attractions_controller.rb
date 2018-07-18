class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(att_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @attraction.update(att_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render "edit"
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end

  private

    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def att_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :happiness_rating,
        :nausea_rating,
        :tickets
      )
    end
end
