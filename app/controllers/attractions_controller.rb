class AttractionsController < ApplicationController
  before_action :not_logged_in
  skip_before_action :not_logged_in, only: [:index]
  before_action :admin_required, only: [:new, :create, :edit, :update]
  before_action :find_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
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

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction == nil
      redirect_to attractions_path
    end
  end

  def admin_required
    redirect_to user_path(current_user) if !current_user.admin
  end

end
