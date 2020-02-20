class RidesController < ApplicationController

    def new
        
    end

    def create
        self.take_ride
        @ride = Ride.new
    end
end
