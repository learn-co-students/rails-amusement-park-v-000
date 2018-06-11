class AttractionsController < ApplicationController
  before_action :authentication_redirect, :only => [:index, :show]
  before_action :current_user, :only => [:show]
  before_action :admin_redirect, :only => [:new, :create, :edit, :update, :destroy]

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      flash[:errors] = attraction.errors.full_messages
      render :new
    end
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by(:id => params[:id])
  end

  def update
    @attraction = Attraction.find_by(:id => params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:notice] = @attraction.errors.full_messages
    end
  end

  def destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end