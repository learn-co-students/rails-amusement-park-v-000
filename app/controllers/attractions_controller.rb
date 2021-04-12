class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end
    
    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

#    def rides
#        flash[:alert] = Ride.create(ride_params).take_ride
#    
#        redirect_to user_path(current_user)
#    end
    
    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def update
        attraction = Attraction.find_by(id: params[:id])
        attraction.update(attraction_params)
        redirect_to attraction_path(attraction)
    end


    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end 
 
    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
      end
    


end 