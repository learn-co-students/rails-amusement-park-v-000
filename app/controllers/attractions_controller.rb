class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end
  #
  #
  # def create #can only create a ride if you are an owner (admin)
  #   #if @user.admin
  #     @attraction = Attraction.new(attraction_params)
  #   #   @attraction.save #validate that all fields are entered?
  #   #   redirect_to attraction_path(@attraction)
  #   # else
  #   #   redirect_to new_attraction_path
  #   #   #flash error
  #   # end
  # end

  def edit
  end

  def update
  end
  

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
