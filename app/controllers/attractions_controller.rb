class AttractionsController < ApplicationController

  def new
  end

  def create
  end

  def show

  end

  def index
    @attractions = Attraction.all
  end

  private

 def attraction_params
   params.require(:attraction).permit(:name)
 end

end
