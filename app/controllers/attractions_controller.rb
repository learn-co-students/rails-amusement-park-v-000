class AttractionsController < ApplicationController
  before_action :admin?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attract_params)
    render 'new' unless @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attract_params)
    redirect_to attraction_path(@attraction)
  end

  private

    def attract_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end

  end
