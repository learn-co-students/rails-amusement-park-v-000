class AttractionsController < ApplicationController

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def index
    @attractions = Attraction.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_rating
    )
  end
end
