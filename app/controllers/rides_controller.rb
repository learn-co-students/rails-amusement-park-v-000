class RidesController < ApplicationController

      def index
      end

      def new

      end

      def create

        #byebug
        @ride = Ride.new(user_id: current_user.id, attraction_id: params["attraction_id"])
        @ride.save
        attraction = Attraction.find(params["attraction_id"])
        user = current_user
        if attraction.min_height > user.height && attraction.tickets > user.tickets
          flash[:message] = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
          flash[:message] = "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets
          flash[:message] = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else
          flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
        end
        #@
        @ride.take_ride

        redirect_to user_path(current_user)
      end




end
