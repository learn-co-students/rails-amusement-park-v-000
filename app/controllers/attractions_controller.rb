class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :authentication_required
  def index
    @attractions = Attraction.all
  end

  def show
    # create this instance to use it in the view show, it has already the user and the attraction.
    @ride = @attraction.rides.build(user_id: current_user.id)

  end

  private
  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
