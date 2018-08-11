class AttractionsController < ApplicationController
  before_action :require_login

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
    attraction = Attraction.create(att_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      render 'attractions/new'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(att_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      render 'attractions/edit'
    end
  end

private

  def att_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
