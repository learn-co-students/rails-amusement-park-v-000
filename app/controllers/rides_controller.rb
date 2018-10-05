class RidesController < ApplicationController

    def update
      ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
      if ride.take_ride == true
        current_user.reload
        flash[:notice]= "Thanks for riding the #{ride.attraction.name}!"
      else
        flash[:alert]="#{ride.take_ride}"
      end
      redirect_to user_path(current_user)
    end
end
