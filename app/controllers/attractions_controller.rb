class AttractionsController < ApplicationController
  before_action :require_login

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = @attraction.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = @attraction.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if Attraction.find(params[:id]) && helpers.is_admin?
      Attraction.destroy(params[:id])
    end
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
