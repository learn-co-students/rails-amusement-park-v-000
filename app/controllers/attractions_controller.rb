class AttractionsController < ApplicationController
  before_action :require_login

  def index
    if admin?
      redirect_to admin_attractions_path
    else
      @attractions = Attraction.all
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    if admin?
      render 'admin/attractions/show'
    else
      render :show
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

 def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
