class AttractionsController < ApplicationController
   before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @user = current_user
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
       redirect_to attraction_path(@attraction)
      else
         render :new
      end
    end


  def update
      if @attraction
        @attraction.update(attraction_params)
         redirect_to attraction_path(@attraction)
      else
         render :edit
      end
  end


  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
    end
end
