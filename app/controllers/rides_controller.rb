class RidesController < ApplicationController

    def create
        self.take_ride
        @ride = Ride.new
    end
end
