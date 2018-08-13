class Admin::AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  # def create
  #   @attraction = Attraction.new(attraction_params)
  #   if @attraction.save
  #     redirect_to "/attraction/#{@attraction.id}"
  #   else
  #     redirect_to '/admin/attractions/new'
  #   end
  # end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
