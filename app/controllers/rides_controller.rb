class RidesController < ApplicationController

      def index
      end

      def new
        @ride = Ride.new
        #render :new
      end

      def create
        @ride = Ride.new(ride_params)
        @ride.save
      end



      private
      def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
      end


end
