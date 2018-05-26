class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, except: [:new, :create]

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets,
                                         :happiness_rating, :nausea_rating)
  end

end
