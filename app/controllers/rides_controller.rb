class RidesController < ApplicationController

    def new
        @ride = Ride.new
    end
    
    
    def create
        self.take_ride
        @ride = Ride.new
    end
end
