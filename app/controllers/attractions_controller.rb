class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
      if session[:user_id]
        @user = User.find_by_id(session[:user_id])
          if @user.admin
            render "new"
          end
      end
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to "/attractions/#{@attraction.id}"
  end

  def index
    if !!session[:user_id]
      @user = User.find_by_id(params[:id])
      @attractions = Attraction.all
    else
      redirect_to '/'
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
        @attraction = Attraction.find_by_id(params[:id])
        @attraction.update(attraction_params)
        @attraction.save
        redirect_to "/attractions/#{@attraction.id}"
    end

  private

     def attraction_params
        params.require(:attraction).permit(:name,:nausea_rating, :happiness_rating, :tickets, :min_height)
     end

end
