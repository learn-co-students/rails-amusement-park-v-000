class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    render :new
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])

    if @attraction
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)

    if current_user.admin
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
  end
end
