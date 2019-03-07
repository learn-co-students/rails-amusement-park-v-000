class AttractionsController < ApplicationController

def new
end


def edit
	@attraction = Attraction.find(params[:id])
end


def create
	@attraction = Attraction.create(attr_params)
	redirect_to "/attractions/#{@attraction.id}"
end

def show
	@attraction = Attraction.find(params[:id])
	@user = User.find(session["user_id"])
	@ride = Ride.new(:attraction_id => @attraction.id, :user_id => @user.id)
end

def index
	@user = User.find(session["user_id"])
end

def update
	
    @attraction = Attraction.find(params[:id])

    @attraction.update(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  
end

def destroy
	attraction = Attraction.find(params[:id])
    attraction.destroy
end

private
 
  def attr_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end



end
