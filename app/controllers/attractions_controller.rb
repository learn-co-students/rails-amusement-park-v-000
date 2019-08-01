class AttractionsController < ApplicationController

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
    # should only work if user is admin

    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      # Lets you create an attraction even if all information isn't filled out
      flash[:message] = "Please enter all requested information."
      redirect_to new_attraction_path
    end
  end

  def edit
    # update #current_attraction so it works here
    @attraction = Attraction.find_by(params[:id])
  end

  def update
    # update #current_attraction so it works here
    attraction = Attraction.find_by(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
