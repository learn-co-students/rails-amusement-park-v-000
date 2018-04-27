class AttractionsController < ApplicationController
 before_action :set_attraction, only: [:show, :edit, :update, :destroy]
def index
    @attractions = Attraction.all
end

def show
        @ride = Ride.new
    # @attraction = Attraction.find(params[:id])
end

def new
    @attraction = Attraction.new
end

def edit
end

def create
    @attraction = Attraction.new(attraction_params)
    if current_user.admin
        @attraction.save
    redirect_to @attraction
else
    render :new
    end
end

def update
    if @attraction.update(attraction_params)
        redirect_to @attraction
    else
        render :edit
    end
end

def destroy
        @attraction.destroy
    redirect_to root_url
end

private


def set_attraction
    @attraction = Attraction.find_by(params[:id])
end

def attraction_params
params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
end

end
