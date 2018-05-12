class AttractionsController < ApplicationController
  before_action :authentication_redirect, :current_user, :only => [:show, :update, :edit]
  before_action :set_attraction, :only => [:edit, :update, :create]

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name,:happiness_rating, :nausea_rating, :tickets, :min_height)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end
