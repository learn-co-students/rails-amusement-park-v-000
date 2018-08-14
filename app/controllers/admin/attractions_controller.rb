class Admin::AttractionsController < ApplicationController

  before_action :require_login

  def new
    if admin_user?
      @attraction = Attraction.new
    else
      redirect_to '/attractions'
      flash[:notice] = "You must be an admin to access that page"
    end
  end

  # def create
  #   @attraction = Attraction.new(attraction_params)
  #   if @attraction.save
  #     redirect_to "/attraction/#{@attraction.id}"
  #   else
  #     redirect_to '/admin/attractions/new'
  #   end
  # end

  def edit
    if admin_user?
      @attraction = Attraction.find(params[:id])
    else
      redirect_to '/attractions'
      flash[:notice] = "You must be an admin to access that page"
    end
  end

  def update
    if admin_user?
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to '/attractions'
      flash[:notice] = "You must be an admin to access that page"
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
