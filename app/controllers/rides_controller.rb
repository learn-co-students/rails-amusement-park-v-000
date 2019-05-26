class RidesController < ApplicationController

      def index
      end

      def new

      end

      def create
        #byebug
        @ride = Ride.new(user_id: current_user.id, attraction_id: params["attraction_id"])
        @ride.save
        @ride.take_ride
        flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
        redirect_to user_path(current_user)
      end




end
